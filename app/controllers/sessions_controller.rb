class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where("first_name = ? AND last_name = ?",  params[:session][:first_name], params[:session][:last_name]).take
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to user, flash: {success: 'Successfully logged in'}
    else
      flash.now[:error] = 'Invalid user / password'
      render 'new'
    end

  end

  def destroy
    logout
    redirect_to root_path, flash: {notice: 'Succesfully logged out'}
  end

end
