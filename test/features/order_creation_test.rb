require_relative '../test_helper'

class OrderCreationTest < ActiveSupport::TestCase
  include Capybara::DSL

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_has_the_correct_item_data_on_the_page
    item = Item.random
    visit "/items/#{item.id}"

    assert_equal 200, page.status_code
    within('h5') do
      assert page.has_content?(item.name), "page should have a header of the item"
    end
    within('p') do
      assert page.has_content?(item.description), "items description should be listed as well"
    end

    within('div.col-sm-3') do
      assert page.has_button?("Add Order"), "each item should have button to add order"
    end
  end

  def test_it_adds_order_when_button_is_clicked
    item = Item.random
    visit "/items/#{item.id}"

    assert_difference('Order.count', 1) do
      click_link_or_button("Add Order")
    end

    order = Order.last

    assert_equal item, order.items.first, "Most recent order has the item whose page it was created on."
    assert_equal "/orders/#{order.id}", current_path
    assert page.has_content?("Order has been added!"), "Flash message after order creation"
  end
end
