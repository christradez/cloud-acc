class Sales::CustomersController < ApplicationController
  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_user.tenant.customers
  end

  def show
  end

  def new
    @customer = current_user.tenant.customers.build
  end

  def create
    @customer = current_user.tenant.customers.build(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: 'Customer was successfully destroyed.'
  end

  private

  def set_customer
    @customer = current_user.tenant.customers.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :customer_type, :tax_id, :payment_terms, :currency)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
