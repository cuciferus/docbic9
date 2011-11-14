class ChangeParentIdMedicamentes < ActiveRecord::Migration
  def up
    rename_column :medicamentes, :pacient_id, :vizitum_id
  end

  def down
  end
end
