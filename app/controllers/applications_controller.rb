class ApplicationsController < ApplicationController
  before_action :set_application, only: [ :change_pending, :change_positive, :change_negative, :update, :show, :destroy]

  def change_pending
    @application.pending = true
    @application.positive = false
    @application.negative = false
    @application.save
    redirect_to applications_path
  end

  def change_positive
    @application.pending = false
    @application.positive = true
    @application.negative = false
    @application.save
    redirect_to applications_path
  end

  def change_negative
    @application.pending = false
    @application.positive = false
    @application.negative = true
    @application.save
    redirect_to applications_path
  end

  def index
    if logged_in?
      @applications = Application.all.order(created_at:  :desc)
    else
      redirect_to root_path
    end
  end

  def update
  if (@application.positive = false)
    @application.positive = true
  else if(@application.positive = false)
    @application.positive = true
       end
  end
    @application.save
  end

  def new
    if(current_user.isAdmin == false)
      @application = Application.new
      @division = Division.all
      @offer = Offer.all
    else
      redirect_to root_path
    end
  end

  def create
    @offer = Offer.all
    @division = Division.all
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
    if(current_user.isAdmin == true || @application.user == current_user)
    else
      redirect_to root_path
    end
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