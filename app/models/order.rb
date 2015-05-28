class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  def pretty_amount
    if amount
      new_amount = "$#{amount}"
      tack_on_zeros(new_amount)
    else
      "$0.00"
    end
  end

  def tack_on_zeros(new_amount)
      if new_amount.gsub(/\d*$/).first.length < 2
        new_amount += "0"
        tack_on_zeros(new_amount)
      else
        new_amount
      end
  end
end
