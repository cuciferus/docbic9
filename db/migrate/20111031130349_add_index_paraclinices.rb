class AddIndexParaclinices < ActiveRecord::Migration
  def up
    add_index :paraclinices, :vizita_id, :name => "index_paraclinices_on_vizita_id"
  end

  def down
  end
end
