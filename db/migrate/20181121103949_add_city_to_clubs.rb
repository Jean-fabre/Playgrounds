class AddCityToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :city, :string
  end
end
