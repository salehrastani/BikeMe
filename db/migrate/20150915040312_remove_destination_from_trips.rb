class RemoveDestinationFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :destination, :string
  end
end
