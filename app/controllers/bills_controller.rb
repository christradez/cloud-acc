class BillsController < ApplicationController
  before_action :authorize
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = current_user.tenant.bills
  end

  def show
  end

  def new
    @bill = current_user.tenant.bills.build
  end

  def create
    @bill = current_user.tenant.bills.build(bill_params)
    if @bill.save
      redirect_to bills_path, notice: 'Bill was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bill.update(bill_params)
      redirect_to bills_path, notice: 'Bill was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path, notice: 'Bill was successfully destroyed.'
  end

  private

  def set_bill
    @bill = current_user.tenant.bills.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:supplier_id, :status, :date, :due_date, :total, bill_items_attributes: [:id, :item_id, :quantity, :unit_price, :total, :_destroy])
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
