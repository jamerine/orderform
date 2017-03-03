class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :product_number, null: false, unique: true
      t.boolean :active, default: true
      t.string :product_page_url
      t.references :account, index: true, foreign_key: true

      t.timestamps
    end
  end
end
