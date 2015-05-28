class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    Item.find_by(id: params[:item]).orders.create
    flash[:ordercomplete] = "Order has been added!"
    redirect_to item_path(params[:item])
  end

  private

  def order_params
   params.permit(:item)
  end
end
