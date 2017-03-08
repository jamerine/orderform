class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.decimal   :subtotal, :precision => 12, :scale => 2
      t.decimal   :tax, :precision => 12, :scale => 2
      t.decimal   :shipping, :precision => 12, :scale => 2
      t.decimal   :total, :precision => 12, :scale => 2
      t.references :account
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zip_code


      t.timestamps
    end
  end
end
