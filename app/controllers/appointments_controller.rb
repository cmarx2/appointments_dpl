class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy ]
  before_action :set_patient
  # before_action :set_physician, only: [:update]
  
  def index
    @appointments = @patient.appointments
    #@patient = Patient.appointments.find(params[:patient_id])
  end

  def show
  end

  def new
    @appointment = @patient.appointments.new
  end
  
  def create
    @appointment = @patient.appointments.new(appt_params)
    if @appointment.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end
  
    def edit
    end

  def update
    if @appointment.update(appt_params)
      redirect_to patient_path(@patient)
    else 
      render :edit
    end
  end

  def destroy
    @patient.appointments.find(params[:id]).destroy
    redirect_to patient_path(@patient)
  end


  private


  def set_physician
    @physician = Physician.find(params[:physician_id])
  end
  
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appt_params
    params.require(:appointment).permit(:date, :patient_id, :physician_id)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
