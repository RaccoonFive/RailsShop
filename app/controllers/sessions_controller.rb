class SessionsController < ApplicationController
  def new
  end

  def index
    redirect_to new_session_path
  end

  def create
    @user = User.where(username: params[:user][:username], password: params[:user][:password])
    if(!@user.blank?)
      session[:user] = @user
      redirect_to root_path
    else
      @error = "There was an error logging you in!"
      render :template => "sessions/error"
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end
end
