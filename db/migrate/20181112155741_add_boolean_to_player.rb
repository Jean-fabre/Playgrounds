class AddBooleanToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :tennis, :boolean
    add_column :players, :padel, :boolean
    add_column :players, :squash, :boolean
    add_column :players, :tennis_level, :string
    add_column :players, :padel_level, :string
    add_column :players, :squash_level, :string
  end
end
