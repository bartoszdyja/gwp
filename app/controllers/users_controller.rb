class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user, flash: {notice: 'User successfully created'}
    else
      flash[:error] = 'Cannot save user'
      render 'new'
    end
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def authenticate_user
    redirect_to login_path, flash: {error: 'You need to sign in.' } if current_user != User.find(params[:id])
  end
end
