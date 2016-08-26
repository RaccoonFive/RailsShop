class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if (@user.save)
      redirect_to root_path
    end
  end
end
