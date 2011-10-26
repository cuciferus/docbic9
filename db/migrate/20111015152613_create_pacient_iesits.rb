class CreatePacientIesits < ActiveRecord::Migration
  def change
    create_table :pacient_iesits do |t|
      t.date :data
      t.string :motiv
      t.references :pacient

      t.timestamps
    end
    add_index :pacient_iesits, :pacient_id
  end
end
