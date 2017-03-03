class CreateProductsSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :products_sizes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true

      t.timestamps
    end
  end
end
