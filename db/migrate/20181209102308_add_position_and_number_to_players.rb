class AddPositionAndNumberToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :position, :string
    add_column :players, :number, :integer
  end
end
