class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def user_logged
    return !session[:user].nil?
  end

  helper_method :user_logged
end
