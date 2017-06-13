class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :destroy]

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = User.first
    if @application.save
      flash[:notice] = "Zgłoszenie zostało stworzone z powodzeniem"
      redirect_to application_path(@application)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @application.destroy
    flash[:notice] = "Zgłoszenie zostało usunięte"
    redirect_to applications_path

  end

  private
    def set_application
      @application = Application.find(params[:id])
    end
    def application_params
      params.require(:application).permit(:jobType, :division, :technologies, :cv, :certificates)
    end
end