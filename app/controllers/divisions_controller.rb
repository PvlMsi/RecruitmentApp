class DivisionsController < ApplicationController
  before_action :set_offer, only: [ :show, :destroy]

  def index
    if logged_in? && current_user.isAdmin
      @division = Division.all
    else
      redirect_to root_path
    end
  end

  def new
    if logged_in? && current_user.isAdmin
      @division = Division.new
    else
      redirect_to root_path
    end
  end

  def create
    @division = Division.new(offer_params)
    if @division.save
      flash[:success] = "Dodano nową ofertę"
      redirect_to divisions_path
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    @division.destroy
    flash[:warning] = "Oferta została usunięta"
    redirect_to divisions_path
  end

  private
  def set_division
    @division = Division.find(params[:id])
  end
  def division_params
    params.require(:division).permit(:divisionName)
  end
end