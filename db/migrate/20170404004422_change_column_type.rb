class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :ordering_number, 'integer USING CAST(ordering_number AS integer)'
  end
end
