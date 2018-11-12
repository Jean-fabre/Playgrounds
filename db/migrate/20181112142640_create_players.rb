class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :phone_number
      t.text :description
      t.string :tennis_level
      t.string :squash_level
      t.string :padel_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
