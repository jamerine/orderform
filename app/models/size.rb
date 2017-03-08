class Size < ApplicationRecord
  has_many :products_sizes
  has_many :products, through: :products_sizes
  has_many :order_items


  def name_with_price
    "#{ self.name } - #{ helper.number_to_currency(self.price) }"
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end
