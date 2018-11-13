class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :booked_from
      t.date :booked_to
      t.references :user, foreign_key: true
      t.references :field, foreign_key: true
      t.timestamps
    end
  end
end
