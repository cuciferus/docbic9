class AddTipvizitaToAnamneza < ActiveRecord::Migration
  def change
    add_column :anamnezas, :tip_vizita, :string
  end
end
