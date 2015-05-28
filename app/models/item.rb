class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.random
   Item.all.sample
  end
end
