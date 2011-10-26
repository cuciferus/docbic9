class CreateMedicamentes < ActiveRecord::Migration
  def change
    create_table :medicamentes do |t|
      t.integer :insulina
      t.string :tip_fier
      t.integer :doza_fier
      t.string :tip_ase
      t.integer :doza_ase
      t.boolean :beta_blocante
      t.boolean :ras
      t.boolean :diuretice
      t.boolean :vasodilatatoare
      t.date :data
      t.references :pacient

      t.timestamps
    end
    add_index :medicamentes, :pacient_id
  end
end
