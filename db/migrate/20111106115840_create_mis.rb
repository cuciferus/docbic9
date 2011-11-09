class CreateMis < ActiveRecord::Migration
  def change
    create_table :mis do |t|
      t.integer :greutate
      t.integer :aport
      t.integer :simptome_gi
      t.integer :capacitate_functionala
      t.integer :co_morbiditate
      t.integer :grasime
      t.integer :muschi
      t.integer :bmi
      t.integer :albumina
      t.integer :tibc
      t.references :vizita

      t.timestamps
    end
    add_index :mis, :vizita_id
  end
end
