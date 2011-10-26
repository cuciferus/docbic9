class CreateSgas < ActiveRecord::Migration
  def change
    create_table :sgas do |t|
      t.references :pacient
      t.date :data
      t.integer :modificari_greutate
      t.integer :modificari_aport_alimentar
      t.integer :simptome_gi
      t.integer :capacitate_functionala
      t.integer :comorbiditatea
      t.integer :grasime
      t.integer :amiotrofie
      t.integer :imc
      t.integer :pcr
      t.integer :feritina
      t.integer :albumina

      t.timestamps
    end
  end
end
