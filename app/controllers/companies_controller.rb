class CompaniesController < ApplicationController
  before_action :authorize

  def edit
    @company = current_user.tenant
  end

  def update
    @company = current_user.tenant
    if @company.update(company_params)
      redirect_to edit_company_path, notice: 'Company profile updated.'
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:tenant).permit(:name, :address, :contact, :logo)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
