class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :destroy]
  
  def index
    @patients = Patient.all
  end

  def show
    # Before Action
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if 
      @patient.save
      redirect_to @patient
    else
    render :new
    end
  end

  def destroy
    @patient.destroy
    redirect_to patient_path
  end

  private

    def set_patient
      @paitnet =Patient.find(params[:id])
    end

    def patient_params
    params.require(:patient).permit(:patient_name)
    end

end
