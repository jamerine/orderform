class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.decimal   :subtotal, :precision => 12, :scale => 2
      t.decimal   :tax, :precision => 12, :scale => 2
      t.decimal   :shipping, :precision => 12, :scale => 2
      t.decimal   :total, :precision => 12, :scale => 2
      t.references :account
      t.string :shipping_first_name
      t.string :shipping_last_name
      t.string :shipping_email
      t.string :shipping_branch_number
      t.string :shipping_phone_number
      t.string :shipping_address_line_1
      t.string :shipping_address_line_2
      t.string :shipping_city
      t.string :shipping_state
      t.integer :shipping_zip_code
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_email
      t.string :billing_branch_number
      t.string :billing_phone_number
      t.string :billing_address_line_1
      t.string :billing_address_line_2
      t.string :billing_city
      t.string :billing_state
      t.integer :billing_zip_code
      t.boolean :same_as_billing



      t.timestamps
    end
  end
end
