class AddColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pc_id_number, :string
  end
end
