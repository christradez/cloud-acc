class EmployeesController < ApplicationController
  before_action :authorize
  before_action :check_payroll_enabled
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = current_user.tenant.employees
  end

  def show
  end

  def new
    @employee = current_user.tenant.employees.build
  end

  def create
    @employee = current_user.tenant.employees.build(employee_params)
    if @employee.save
      redirect_to employees_path, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: 'Employee was successfully destroyed.'
  end

  private

  def set_employee
    @employee = current_user.tenant.employees.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :salary)
  end

  def check_payroll_enabled
    unless current_user.tenant.payroll
      redirect_to root_url, alert: 'Payroll module is not enabled.'
    end
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
