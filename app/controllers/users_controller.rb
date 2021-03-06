class UsersController < ApplicationController

  def login
    @user = User.new
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account was successfully created"
      redirect_to root_path
    else
      flash[:failure] = "We could not make an account with that info"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
