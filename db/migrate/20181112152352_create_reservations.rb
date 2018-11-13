class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :booking_day
      t.date :booking_hour_start
      t.date :booking_hour_end
      t.references :user, foreign_key: true
      t.references :field, foreign_key: true
      t.timestamps
    end
  end
end
