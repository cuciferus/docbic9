class Changeparaclinicesreferences < ActiveRecord::Migration
  def up
    remove_index :paraclinices, 'vizita_id'
    remove_column :paraclinices, :pacient_id
    add_column :paraclinices, :vizita, :integer
    add_index :paraclinices, 'vizita'
  end

  def down
  end
end
