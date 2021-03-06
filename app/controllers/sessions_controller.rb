class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Hello #{@user.name}, you are now signed in"
      redirect_to root_path
    else
      flash[:failure] = "That login was unsuccessful"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
