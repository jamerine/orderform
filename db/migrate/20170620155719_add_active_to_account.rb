class AddActiveToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :active, :boolean
  end
end
