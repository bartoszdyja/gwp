class SessionsController < ApplicationController
  def new
  end

  def create
    users_last_name = User.where(first_name: params[:session][:first_name])
    user = users_last_name.where(last_name: params[:session][:last_name]).take
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid user / password'
      render 'new'
    end

  end

  def destroy
    logout
    redirect_to root_path
  end

end
