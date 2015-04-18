class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.string :duration
      t.integer :price
      t.integer :driver_id
      t.integer :passenger_id

      t.timestamps null: false
    end
  end
end
