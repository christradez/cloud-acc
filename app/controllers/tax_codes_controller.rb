class TaxCodesController < ApplicationController
  before_action :authorize
  before_action :set_tax_code, only: [:edit, :update, :destroy]

  def index
    @tax_codes = current_user.tenant.tax_codes
  end

  def new
    @tax_code = current_user.tenant.tax_codes.build
  end

  def create
    @tax_code = current_user.tenant.tax_codes.build(tax_code_params)
    if @tax_code.save
      redirect_to tax_codes_path, notice: 'Tax code was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tax_code.update(tax_code_params)
      redirect_to tax_codes_path, notice: 'Tax code was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tax_code.destroy
    redirect_to tax_codes_path, notice: 'Tax code was successfully destroyed.'
  end

  private

  def set_tax_code
    @tax_code = current_user.tenant.tax_codes.find(params[:id])
  end

  def tax_code_params
    params.require(:tax_code).permit(:name, :rate)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
