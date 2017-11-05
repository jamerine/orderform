class AddPcidRequiredToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :require_pc_id_number, :boolean
  end
end
