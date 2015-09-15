class AddOriginToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :origin, :hstore
  end
end
