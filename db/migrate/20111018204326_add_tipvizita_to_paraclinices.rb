class AddTipvizitaToParaclinices < ActiveRecord::Migration
  def change
    add_column :paraclinices, :tip_vizita, :string
  end
end
