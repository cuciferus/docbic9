class ChangeTelefonTypeForPacient < ActiveRecord::Migration
  def up
    change_column :pacients, :telefon1, :string, :limit =>10
    change_column :pacients, :telefon2, :string, :limit =>10
  end

  def down
  end
end
