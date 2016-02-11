class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, flash: {notice: 'User successfully created'}
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
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
