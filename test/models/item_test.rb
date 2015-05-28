require_relative '../test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_it_can_return_a_random_instance_of_item
    assert Item.random, "self.random"
    assert Item.random.is_a?(Item)
  end
end
