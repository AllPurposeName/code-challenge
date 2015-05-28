class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Item.find_by(id: params[:item]).orders.create(user_id: User.first.id)
    OrderEmailWorker.perform_async(order)
    flash[:ordercomplete] = "Order has been added!"
    redirect_to order_path(order)
  end

  private

  def order_params
   params.permit(:item)
  end
end
