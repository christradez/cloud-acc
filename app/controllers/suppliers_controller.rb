class SuppliersController < ApplicationController
  before_action :authorize
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @suppliers = current_user.tenant.suppliers
  end

  def show
  end

  def new
    @supplier = current_user.tenant.suppliers.build
  end

  def create
    @supplier = current_user.tenant.suppliers.build(supplier_params)
    if @supplier.save
      redirect_to suppliers_path, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to suppliers_path, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path, notice: 'Supplier was successfully destroyed.'
  end

  private

  def set_supplier
    @supplier = current_user.tenant.suppliers.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :tax_id)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
