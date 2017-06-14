class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #save user id in cookies
      flash[:success] = "Logowanie zakończone powodzeniem"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Błędnie wprowadzone dane"
      render 'new'
    end
  end

  def destroy

  end
end