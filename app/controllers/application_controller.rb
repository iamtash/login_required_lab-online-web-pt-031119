class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
      session.include? :name
  end

  def require_login
    redirect_to sessions_new_path unless session.include? :name
  end

  def current_user
    @current_user ||= session[:name]
  end
end
