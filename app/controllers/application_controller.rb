class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_user, :changePendingStatus

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #if there is not current_user then return user based on id if there is user_id that is stored in session
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Musisz być zalogowany"
      redirect_to root_path
    end
  end
end
