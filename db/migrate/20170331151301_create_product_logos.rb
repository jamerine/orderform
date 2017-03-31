class CreateProductLogos < ActiveRecord::Migration[5.0]
  def change
    create_table :product_logos do |t|
      t.string :name
      t.string :product_logo_image
      t.references :account, index: true, foreign_key: true

      t.timestamps
    end
  end
end
