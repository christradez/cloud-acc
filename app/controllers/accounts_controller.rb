class AccountsController < ApplicationController
  before_action :authorize
  before_action :set_account, only: [:edit, :update, :destroy]

  def index
    @accounts = current_user.tenant.accounts
  end

  def new
    @account = current_user.tenant.accounts.build
  end

  def create
    @account = current_user.tenant.accounts.build(account_params)
    if @account.save
      redirect_to accounts_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: 'Account was successfully destroyed.'
  end

  private

  def set_account
    @account = current_user.tenant.accounts.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :account_type)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
