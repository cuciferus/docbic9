class AddCentruToPacients < ActiveRecord::Migration
  def change
    add_column :pacients, :centru, :string
  end
end
