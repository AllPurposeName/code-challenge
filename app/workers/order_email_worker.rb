class OrderEmailWorker
  include Sidekiq::Worker

  def perform(order)
    OrderMailer.order_for_overlord(order).deliver
  end
end
