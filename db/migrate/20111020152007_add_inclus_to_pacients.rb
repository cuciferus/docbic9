class AddInclusToPacients < ActiveRecord::Migration
  def change
    add_column :pacients, :inclus, :boolean
  end
end
