
class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && has_account?(user)
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to user
    else
      flash.now[:alert] = 'Credentials incorrect. Please try again.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

  private

  def has_account?(user)
    user.password === params[:session][:password]
  end

end