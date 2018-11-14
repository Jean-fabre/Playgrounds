class AddCoordinatesToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :latitude, :float
    add_column :clubs, :longitude, :float
  end
end
