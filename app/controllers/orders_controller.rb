class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    if Order.exists?(item_id: @item.id) || current_user.id == @item.user_id
      redirect_to root_path
     else
      @order = OrderAddress.new
      @user = current_user.id
     end
  end
  
  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:token,:authenticity_token,:postal_code, :prefecture_name_id, :city, :address, :building, :phone, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    item_params
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'               
      )
  end


end
