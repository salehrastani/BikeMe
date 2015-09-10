class AddCompleteToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :complete, :boolean
  end
end
