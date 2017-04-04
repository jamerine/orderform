class AddColumnsToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :ordering_number, :integer
  end
end
