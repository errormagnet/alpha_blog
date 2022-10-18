# frozen_string_literal: true

# Articles CRUD controller
class UsersController < ApplicationController
  before_action :require_user, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account successfully created. Welcome.'
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Profile Updated'
      redirect_to user_path
    else
      redirect_to user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = 'You can only edit your own profile.'
      redirect_to @user
    end
  end

end
