class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(username: params[:user][:username], password: params[:user][:password])
    if(!@user.blank?)
      session[:user] = @user
    end
    redirect_to root_path
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end
end
