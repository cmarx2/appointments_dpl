class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy ]
  before_action :set_patient
  before_action :set_physician, only: [:new, :create, :update]
  
  def index
    @appointments = @patient.appointments
    #@patient = Patient.appointments.find(params[:patient_id])
  end

  def show
  end

  def new
    @appointment = @patient.appointments.new
  end

  def edit

  end

  def create
    @appointment = @patient.appointments.new(appointment_params)

    if @appointment.save
      redirect_to patient_appointments_path(@patient)
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path(@patient)
    else 
      render :edit
    end
  end

  def destroy
    @patient.appointments.find(params[:id]).destroy
    redirect_to patient_appointments_path(@patient)
  end


  private

  def set_physician
    @physician = Physician.all - @patient.physicians
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.permit(:date, :physician_id, :patient_id)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
