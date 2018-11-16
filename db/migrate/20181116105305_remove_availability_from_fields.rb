class RemoveAvailabilityFromFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :fields, :availability, :string
  end
end
