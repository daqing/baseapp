class ApplicationController < ActionController::Base
  helper_method :user_signed_in?
  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def user_signed_in?
    session[:user_id].to_i > 0
  end

  def current_user
    return nil if session[:user_id].nil?

    @current_user ||= User.find(session[:user_id])
  end
end
