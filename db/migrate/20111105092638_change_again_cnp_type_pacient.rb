class ChangeAgainCnpTypePacient < ActiveRecord::Migration
  def up
    change_column :pacients, :cnp, :string, :limit => 13
  end

  def down
  end
end
