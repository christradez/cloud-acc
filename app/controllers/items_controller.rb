class ItemsController < ApplicationController
  before_action :authorize
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.tenant.items
  end

  def show
  end

  def new
    @item = current_user.tenant.items.build
  end

  def create
    @item = current_user.tenant.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = current_user.tenant.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :sku, :category, :brand, :tax_code_id, :base_uom, :quantity)
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
