class CreatePacients < ActiveRecord::Migration
  def change
    create_table :pacients do |t|
      t.string :nume
      t.string :prenume
      t.integer :cnp
      t.integer :telefon1
      t.integer :telefon2
      t.text :adresa
      t.date :data_dg_ckd
      t.date :data_dg_diabet

      t.timestamps
    end
  end
end
