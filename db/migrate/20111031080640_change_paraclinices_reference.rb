class ChangeParaclinicesReference < ActiveRecord::Migration
def change
  rename_index :paraclinices, 'index_paraclinices_on_pacient_id', 'index_paraclinices_on_vizita_id'
end
end
