class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.float   :subtotal
      t.float   :tax
      t.float   :shipping
      t.float   :total

      
      t.timestamps
    end
  end
end
