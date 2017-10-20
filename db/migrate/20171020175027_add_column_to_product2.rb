class AddColumnToProduct2 < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :hide_display_price, :boolean
  end
end
