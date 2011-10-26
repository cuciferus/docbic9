class CreateSf36s < ActiveRecord::Migration
  def change
    create_table :sf36s do |t|
      t.references :pacient
      t.date :data
      t.integer :sanatatea
      t.integer :sanatatea_comparativ
      t.integer :activitati_obositoare
      t.integer :activitati_moderate
      t.integer :ridicat
      t.integer :urcat_etaje
      t.integer :urcat_etaj
      t.integer :aplecat
      t.integer :km1
      t.integer :sute_metri
      t.integer :o_suta_metri
      t.integer :imbaiere
      t.boolean :perioada_timp
      t.boolean :mai_putine
      t.boolean :limitat
      t.boolean :dificultati
      t.boolean :perioada_emotionale
      t.boolean :mai_putine_emotionale
      t.boolean :grija
      t.integer :familie
      t.integer :dureri
      t.integer :durerea
      t.integer :plin_viata
      t.integer :nervos
      t.integer :deprimat
      t.integer :calm
      t.integer :energie
      t.integer :descurajat
      t.integer :extenuat
      t.integer :fericit
      t.integer :obosit
      t.integer :vizite
      t.integer :imbolnavesc
      t.integer :la_fel
      t.integer :inrautateasca
      t.integer :sanatate_excelenta

      t.timestamps
    end
    add_index :sf36s, :pacient_id
  end
end
