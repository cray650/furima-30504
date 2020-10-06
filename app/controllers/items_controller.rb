class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item)
    .permit(:name, :description, :price, :image, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id)
    .merge(user_id: current_user.id)
  end
end
