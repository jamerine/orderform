class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string :name
      t.decimal :price, :precision => 12, :scale => 3

      t.timestamps
    end
  end
end
