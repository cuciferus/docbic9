class ChangeReferenceparaclinicesvizita < ActiveRecord::Migration
  def up
    remove_column :paraclinices, :vizita
    add_column :paraclinices, :vizita_id, :integer
  end

  def down
  end
end
