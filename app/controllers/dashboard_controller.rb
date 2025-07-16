class DashboardController < ApplicationController
  before_action :authorize

  def index
    @total_sales = current_user.tenant.invoices.sum(:total)
    @total_purchases = current_user.tenant.bills.sum(:total)
    @low_stock_items = current_user.tenant.items.where('quantity < 10')
  end

  private

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
