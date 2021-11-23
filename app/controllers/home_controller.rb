class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @employee = Employee.find(current_user.employee_id) if current_user.employee_id.present?
  end
end
