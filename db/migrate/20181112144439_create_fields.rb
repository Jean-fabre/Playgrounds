class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :field_type
      t.string :availability
      t.string :price

      t.references :club, foreign_key: true
      t.timestamps
    end
  end
end
