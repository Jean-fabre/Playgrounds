class AddPhotoToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :photo, :string
  end
end
