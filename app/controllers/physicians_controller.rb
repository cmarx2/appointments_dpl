class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :destroy]

  def index
    @physicians = Physician.all
  end

  def show
  end

  def new
    @physicians = Physician.new
  end

  def create
    @physicians = Physician.new(Physician_params)

    if @physicians.save
      redirect_to @physicians
    else
      render :new
    end
  end

  def destroy 
    @physicians.destroy
    redirect_to physicians_path
  end

  private
    def set_physician
      @physician = Physician.find(params[:id])
    end

    def physician_params
      params.require(:physician).permit(:dr_name)
    end
end
