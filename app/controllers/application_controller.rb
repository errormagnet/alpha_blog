class ApplicationController < ActionController::Base

  helper_method :current_user, :is_authenticated?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_authenticated?
    !!current_user
  end
  def require_user
    unless is_authenticated?
      flash[:alert] = 'You must be logged in to perform this action.'
      redirect_to login_path
    end
  end

end
