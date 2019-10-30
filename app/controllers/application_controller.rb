class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_logged_user!
  helper_method :logged_user

  def check_logged_user!
    unless devise_controller?
      redirect_to '/employees/sign_in' unless current_employee or current_user
    end
  end

  def logged_user
    if current_employee 
      current_employee
    else 
      current_user
    end
  end
end
