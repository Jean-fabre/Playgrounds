class AddColumnsToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :gender, :string
    remove_column :players, :tennis_level
    remove_column :players, :squash_level
    remove_column :players, :padel_level
  end
end
