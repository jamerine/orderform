class ChangeStyleNumberToOrderingNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :style_number, :ordering_number
    
  end
end
