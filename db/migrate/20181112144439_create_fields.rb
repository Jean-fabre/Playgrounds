class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :field_type
      t.date :booking_day
      t.date :booking_hour_start
      t.date :booking_hour_end
      t.string :price

      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
