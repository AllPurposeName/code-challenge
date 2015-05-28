require_relative '../test_helper'

class OrderTest < ActiveSupport::TestCase
  def test_it_displays_the_amount_prettily
    order = Order.create(amount: 3.00)
    order_specific = Order.create(amount: 1.23)
    order_nil = Order.create(amount: nil)
    assert_equal "$3.00", order.pretty_amount
    assert_equal "$1.23", order_specific.pretty_amount
    assert_equal "$0.00", order_nil.pretty_amount
  end
end
