class Changeforeignkeyagain < ActiveRecord::Migration
  def up
    rename_column :paraclinices, :vizita_id, :vizitum_id
  end

  def down
  end
end
