class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  

  def can_access?
    unless current_user && !current_user.root?
      redirect_to root_path
    end
  end
end
