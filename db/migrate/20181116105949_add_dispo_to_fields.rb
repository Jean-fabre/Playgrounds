class AddDispoToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :start_date, :datetime
    add_column :fields, :end_date, :datetime
  end
end
