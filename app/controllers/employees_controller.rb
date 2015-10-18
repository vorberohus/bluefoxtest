class EmployeesController < ApplicationController
  respond_to :json

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find params[:id]
  end

  def create
    @employee = Employee.new employee_params
    @employee.save
    respond_with @employee
  end

  def update
    @employee = Employee.find params[:id]
    @employee.update_attributes employee_params
    respond_with @employee
  end

  private
  
    def employee_params
      params.permit :name, :contact, :salary, :status
    end
end
