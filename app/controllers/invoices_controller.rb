class InvoicesController < ApplicationController
  before_action :authorize
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = current_user.tenant.invoices
  end

  def show
  end

  def new
    @invoice = current_user.tenant.invoices.build
  end

  def create
    @invoice = current_user.tenant.invoices.build(invoice_params)
    if @invoice.save
      redirect_to invoices_path, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoices_path, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path, notice: 'Invoice was successfully destroyed.'
  end

  private

  def set_invoice
    @invoice = current_user.tenant.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:customer_id, :status, :date, :due_date, :total, invoice_items_attributes: [:id, :item_id, :quantity, :unit_price, :total, :_destroy])
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
