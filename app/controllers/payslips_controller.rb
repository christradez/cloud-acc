class PayslipsController < ApplicationController
  before_action :authorize
  before_action :check_payroll_enabled
  before_action :set_employee
  before_action :set_payslip, only: [:show, :edit, :update, :destroy]

  def index
    @payslips = @employee.payslips
  end

  def show
  end

  def new
    @payslip = @employee.payslips.build
  end

  def create
    @payslip = @employee.payslips.build(payslip_params)
    @payslip.tenant = current_user.tenant
    if @payslip.save
      redirect_to employee_payslips_path(@employee), notice: 'Payslip was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payslip.update(payslip_params)
      redirect_to employee_payslips_path(@employee), notice: 'Payslip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payslip.destroy
    redirect_to employee_payslips_path(@employee), notice: 'Payslip was successfully destroyed.'
  end

  private

  def set_employee
    @employee = current_user.tenant.employees.find(params[:employee_id])
  end

  def set_payslip
    @payslip = @employee.payslips.find(params[:id])
  end

  def payslip_params
    params.require(:payslip).permit(:date, :gross_salary, :deductions, :net_salary)
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
