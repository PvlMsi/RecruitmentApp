class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Witamy w serwisie #{@user.username}"
      redirect_to applications_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Twoje konto zostało zedytowane z powodzeniem"
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @user = User.all
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :firstName, :lastName, :phoneNumber)
  end

  def set_user
    @user = User.find(params[:id])
  end
end