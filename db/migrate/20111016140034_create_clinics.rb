class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.float :inaltime
      t.float :greutate
      t.float :tas
      t.float :tad
      t.float :circumferinta_abdomen
      t.float :circumferinta_brat
      t.float :pliu_cutantat_brat
      t.float :forta_de_strangere_mana
      t.date :data
      t.references :pacient

      t.timestamps
    end
    add_index :clinics, :pacient_id
  end
end
