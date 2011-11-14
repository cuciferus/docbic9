class AddBicarbonatToMedicamete < ActiveRecord::Migration
  def change
    add_column :medicamentes, :bicarbonat, :float
  end
end
