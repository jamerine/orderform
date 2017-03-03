class CreateProductsColors < ActiveRecord::Migration[5.0]
  def change
    create_table :products_colors do |t|
      t.references :product, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true

      t.timestamps
    end
  end
end
