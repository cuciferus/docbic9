class ChangeCnpTYpeForPacient < ActiveRecord::Migration
  def up
    change_column :pacients, :cnp, :bigint
  end

  def down
  end
end
