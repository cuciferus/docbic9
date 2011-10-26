class AddDateToAnamnezas < ActiveRecord::Migration
  def change
    add_column :anamnezas, :data, :date
  end
end
