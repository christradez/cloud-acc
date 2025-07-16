class LeadsController < ApplicationController
  before_action :authorize
  before_action :check_crm_enabled
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    @leads = current_user.tenant.leads
  end

  def show
  end

  def new
    @lead = current_user.tenant.leads.build
  end

  def create
    @lead = current_user.tenant.leads.build(lead_params)
    if @lead.save
      redirect_to leads_path, notice: 'Lead was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lead.update(lead_params)
      redirect_to leads_path, notice: 'Lead was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lead.destroy
    redirect_to leads_path, notice: 'Lead was successfully destroyed.'
  end

  private

  def set_lead
    @lead = current_user.tenant.leads.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:name, :email, :phone, :status)
  end

  def check_crm_enabled
    # For now, we'll assume CRM is always enabled if the controller is accessed.
    # We'll add the toggle later.
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
