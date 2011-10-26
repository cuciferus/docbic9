class AddTipvizitaToSgas < ActiveRecord::Migration
  def change
    add_column :sgas, :tip_vizita, :string
  end
end
