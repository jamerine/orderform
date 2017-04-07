class AddMessageToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :order_special_message, :text
  end
end
