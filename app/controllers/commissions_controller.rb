class CommissionsController < ApplicationController
  before_action :authorize
  before_action :check_commissions_enabled

  def index
    @commissions = current_user.tenant.commissions
  end

  private

  def check_commissions_enabled
    unless current_user.tenant.commissions
      redirect_to root_url, alert: 'Commissions module is not enabled.'
    end
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
