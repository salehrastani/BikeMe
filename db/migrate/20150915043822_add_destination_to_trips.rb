class AddDestinationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :destination, :hstore
  end
end
