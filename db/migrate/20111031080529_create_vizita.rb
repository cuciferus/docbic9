class CreateVizita < ActiveRecord::Migration
  def change
    create_table :vizita do |t|
      t.date :data
      t.string :tip
      t.references :pacient

      t.timestamps
    end
    add_index :vizita, :pacient_id
  end
end
