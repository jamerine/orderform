class AddColumnsToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :order_form_subheading, :string
    add_column :accounts, :orders_due_by, :date
  end
end
