class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :color
  belongs_to :size


  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # before_save :finalize

  # def unit_price
  #   if self.persisted?
  #     self[:unit_price]
  #   else
  #     self.product.sizes.find(self[:size_id]).price
  #   end
  # end

  # def total_price
  #   unit_price * quantity
  # end
  #
  # def finalize
  #   self[:unit_price] = unit_price
  #   self[:total_price] = quantity * self[:unit_price]
  # end

end
