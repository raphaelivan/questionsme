class HomeController < ApplicationController
  def index
    @questions = permissions
  end


  private
  def permissions   
    current_user ? Question : current_employee.company.questions 
  end
end
