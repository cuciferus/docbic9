class ChangeMisViztiaId < ActiveRecord::Migration
  def up
    rename_column :mis, :vizita_id, :vizitum_id
    rename_index :mis, :vizita_id, :vizitum_id
  end

  def down
  end
end
