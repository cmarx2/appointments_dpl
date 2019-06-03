class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]


def index

    @patients = Patient.all
  end

  def show


  end

  def new
    @patient = Patient.new
  end

  def create


    if @patient.save
      redirect_to @patient
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
    redirect_to @patient
    else
      render :edit

    end
  end

  def destroy
    @patient.destroy

    redirect_to patients_path
  end

  private
  def set_user
    @patient = Patient.find(params[:id])
  end

  def user_params
    params.require(:patient).permit(:patient_name)
  end


end
