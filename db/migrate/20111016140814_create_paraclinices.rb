class CreateParaclinices < ActiveRecord::Migration
  def change
    create_table :paraclinices do |t|
      t.float :hemoglobina
      t.float :hematocrit
      t.float :pcr
      t.float :glicemie
      t.float :hba1c
      t.float :colesterol_total
      t.float :hdl_colesterol
      t.float :trigliceride
      t.float :albumina
      t.float :tsat
      t.float :feritina
      t.float :calcemie
      t.float :fosfatemie
      t.float :fosfataza_alcalina
      t.float :pth
      t.float :ph
      t.float :pco2
      t.float :hco3
      t.float :sodiu
      t.float :potasiu
      t.float :clor
      t.float :creatinina
      t.float :uree
      t.float :uree_urinara
      t.float :albumina_urinara_spot
      t.float :creatinina_urinara
      t.date :data
      t.references :pacient

      t.timestamps
    end
    add_index :paraclinices, :pacient_id
  end
end
