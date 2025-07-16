class ReportsController < ApplicationController
  before_action :authorize

  def index
  end

  def trial_balance
    @accounts = current_user.tenant.accounts
  end

  def profit_and_loss
    @revenue_accounts = current_user.tenant.accounts.where(account_type: 'Revenue')
    @expense_accounts = current_user.tenant.accounts.where(account_type: 'Expense')
  end

  def balance_sheet
    @asset_accounts = current_user.tenant.accounts.where(account_type: 'Asset')
    @liability_accounts = current_user.tenant.accounts.where(account_type: 'Liability')
    @equity_accounts = current_user.tenant.accounts.where(account_type: 'Equity')
  end

  private

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
