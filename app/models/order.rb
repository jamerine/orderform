class Order < ApplicationRecord
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

  enum status: [:started, :placed, :shipped, :cancelled]



  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def set_order_status
    self.status = 0
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
