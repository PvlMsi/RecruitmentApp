class OffersController < ApplicationController
  before_action :set_offer, only: [ :show, :destroy]

  def index
    if logged_in? && current_user.isAdmin
      @offer = Offer.all
    else
      redirect_to root_path
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Dodano nową ofertę"
      redirect_to offers_path
    else
      render 'new'
    end
  end

  def show

  end

  def destroy

  end

  private
  def set_offer
    @offer = Offer.find(params[:id])
  end
  def offer_params
    params.require(:offer).permit(:offerName)
  end
end