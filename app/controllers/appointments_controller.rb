class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_appointment, only: [:show, :edit, :update, :destroy ]

  
  def index
    @appointments = @physician.appointments
    #@patient = Patient.appointments.find(params[:patient_id])
  end

  def show
  end

  def new
    @appointment = @physician.appointments.new
  end

  def edit

  end

  def create
    @appointment = @physician.appointments.new(appointment_params)

    if @appointment.save
      redirect_to physician_appointments_path(@physician)
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to physician_appointments_path(@physician)
    else 
      render :edit
    end
  end

  def destroy
    @physician.appointments.find(params[:id]).destroy
    redirect_to physician_appointments_path(@physician)
  end


  private


  def set_physician
    @physician = Physician.find(params[:physician_id])
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

  # def set_patient
  #   @patient = Patient.all - @physician.patients
  # end

  #I don't know if we need this set_patient
end
