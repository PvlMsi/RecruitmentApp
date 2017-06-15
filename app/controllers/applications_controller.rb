class ApplicationsController < ApplicationController
  before_action :set_application, only: [ :changePendingStatus, :show, :destroy]

  helper_method :changePendingStatus

  def changePendingStatus
    app = Application.find(12)
    app.positive = true;
    app.save

  end
  def index
    if logged_in? && current_user.isAdmin
      @applications = Application.all
    else
      redirect_to root_path
    end
  end

  def edit

  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      flash[:success] = "Zgłoszenie zostało stworzone z powodzeniem"
      redirect_to application_path(@application)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @application.destroy
    flash[:warning] = "Zgłoszenie zostało usunięte"
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