class CreateAnamnezas < ActiveRecord::Migration
  def change
    create_table :anamnezas do |t|
      t.float :fumator
      t.integer :etanol
      t.boolean :ima
      t.boolean :angina
      t.boolean :icc
      t.boolean :avc
      t.boolean :aomi
      t.boolean :amputatii
      t.boolean :bpoc
      t.string :hepatopatii
      t.string :neoplasm
      t.boolean :retinopatie
      t.integer :spitalizare
      t.string :cod_spitalizare
      t.references :pacient

      t.timestamps
    end
    add_index :anamnezas, :pacient_id
  end
end
