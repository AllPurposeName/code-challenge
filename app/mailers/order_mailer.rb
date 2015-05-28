class OrderMailer < ApplicationMailer
  OVERLORD = 'storedom-overlord@example.com'

  def order_for_overlord(order)
    @order = order
    mail(to: OVERLORD, subject: "New Order, Master")
  end
end
