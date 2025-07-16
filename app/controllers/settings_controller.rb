class SettingsController < ApplicationController
  before_action :authorize

  def edit
    @settings = current_user.tenant
  end

  def update
    @settings = current_user.tenant
    if @settings.update(settings_params)
      redirect_to edit_settings_path, notice: 'Settings updated.'
    else
      render :edit
    end
  end

  private

  def settings_params
    params.require(:tenant).permit(:timezone, :currency, :language, :multi_uom, :payroll, :commissions, :consignment, :samples)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
