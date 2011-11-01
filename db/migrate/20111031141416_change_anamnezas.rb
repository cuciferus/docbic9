class ChangeAnamnezas < ActiveRecord::Migration
  def up
    rename_column :anamnezas, :pacient_id, :vizitum_id
    rename_index :anamnezas, :pacient_id, :vizitum_id
  end

  def down
  end
end
