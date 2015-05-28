class OrderEmailWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find_by(id: order_id)
    OrderMailer.order_for_overlord(order).deliver
  end
end
