class OpportunitiesController < ApplicationController
  before_action :authorize
  before_action :check_crm_enabled
  before_action :set_lead
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = @lead.opportunities
  end

  def show
  end

  def new
    @opportunity = @lead.opportunities.build
  end

  def create
    @opportunity = @lead.opportunities.build(opportunity_params)
    @opportunity.tenant = current_user.tenant
    if @opportunity.save
      redirect_to lead_opportunities_path(@lead), notice: 'Opportunity was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to lead_opportunities_path(@lead), notice: 'Opportunity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @opportunity.destroy
    redirect_to lead_opportunities_path(@lead), notice: 'Opportunity was successfully destroyed.'
  end

  private

  def set_lead
    @lead = current_user.tenant.leads.find(params[:lead_id])
  end

  def set_opportunity
    @opportunity = @lead.opportunities.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :stage, :amount, :close_date)
  end

  def check_crm_enabled
    # For now, we'll assume CRM is always enabled if the controller is accessed.
    # We'll add the toggle later.
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
