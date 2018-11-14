class AddPhotoToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :photo, :string
  end
end
