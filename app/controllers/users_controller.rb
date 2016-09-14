class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if (@user.save)
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
