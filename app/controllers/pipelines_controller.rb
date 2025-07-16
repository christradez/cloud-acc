class PipelinesController < ApplicationController
  before_action :authorize
  before_action :check_crm_enabled
  before_action :set_pipeline, only: [:show, :edit, :update, :destroy]

  def index
    @pipelines = current_user.tenant.pipelines
  end

  def show
  end

  def new
    @pipeline = current_user.tenant.pipelines.build
  end

  def create
    @pipeline = current_user.tenant.pipelines.build(pipeline_params)
    if @pipeline.save
      redirect_to pipelines_path, notice: 'Pipeline was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pipeline.update(pipeline_params)
      redirect_to pipelines_path, notice: 'Pipeline was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pipeline.destroy
    redirect_to pipelines_path, notice: 'Pipeline was successfully destroyed.'
  end

  private

  def set_pipeline
    @pipeline = current_user.tenant.pipelines.find(params[:id])
  end

  def pipeline_params
    params.require(:pipeline).permit(:name)
  end

  def check_crm_enabled
    # For now, we'll assume CRM is always enabled if the controller is accessed.
    # We'll add the toggle later.
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
