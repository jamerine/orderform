class Size < ApplicationRecord
  has_many :products_sizes
  has_many :products, through: :products_sizes
  has_many :order_items


  def name_with_price
    "#{name} - #{ price }"
  end
end
