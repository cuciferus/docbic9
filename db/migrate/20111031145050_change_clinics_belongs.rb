class ChangeClinicsBelongs < ActiveRecord::Migration
  def up
    rename_column :clinics, :pacient_id, :vizitum_id
    rename_index :clinics, :pacient_id, :vizitum_id
  end

  def down
  end
end
