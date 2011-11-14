class ChangeIndexMedicamentes < ActiveRecord::Migration
  def up
    rename_index :medicamentes, :pacient_id, :vizitum_id
  end

  def down
  end
end
