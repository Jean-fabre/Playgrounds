class RemovePhotoFromFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :fields, :photo, :string
  end
end
