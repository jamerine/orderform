class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :business_name, null: false
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country
      t.string :website
      t.string :phone_number
      t.string :phone_number_extension
      t.string :fax_number
      t.string :email_address
      t.string :subdomain, null: false
      t.string :logo

      t.timestamps
    end

    add_index :accounts, :subdomain, unique: true
  end
end
