class AddAcceptedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :accepted, :boolean
  end
end
