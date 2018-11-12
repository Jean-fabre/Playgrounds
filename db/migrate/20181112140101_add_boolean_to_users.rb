class AddBooleanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :player, :boolean
  end
end
