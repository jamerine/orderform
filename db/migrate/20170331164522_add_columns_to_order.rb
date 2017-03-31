class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :product_logo, :string
    add_column :orders, :product_logo_name, :string
  end
end
