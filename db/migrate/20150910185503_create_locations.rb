class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lat
      t.string :lng
      t.integer :locatable_id
      t.string :locatable_type

      t.timestamps null: false
    end
  end
end
