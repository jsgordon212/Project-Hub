class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include Obfuscate

  def current_user?
    @user == current_user
  end

  # def current_user
  #   if (user_id = session[:user_id])
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   # elsif (user_id = cookies.signed[:user_id])
  #   #   user = User.find_by(id: user_id)
  #   #   if user && user.authenticated?(:remember, cookies[:remember_token])
  #   #     log_in user
  #   #     @current_user = user
  #   #   end
  #   end
  # end

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  # def logged_in?
  #   !current_user.nil?
  # end


def login_redirect
  redirect_to login_url unless logged_in?
end
end
