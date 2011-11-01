class ChangeSga < ActiveRecord::Migration
  def up
    rename_column :sgas, :pacient_id, :vizitum_id
    rename_index :sgas, :pacient_id, :vizitum_id
  end

  def down
  end
end
