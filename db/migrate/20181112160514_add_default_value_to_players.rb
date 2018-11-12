class AddDefaultValueToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :players, :tennis, false
    change_column_default :players, :padel, false
    change_column_default :players, :squash, false
  end
end
