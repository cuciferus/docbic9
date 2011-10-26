class AddTipProtocolPacient < ActiveRecord::Migration
  def up
    add_column :pacients, :tip_protocol, :string
  end

  def down
    remove_column :pacients, :tip_protocol
  end
end
