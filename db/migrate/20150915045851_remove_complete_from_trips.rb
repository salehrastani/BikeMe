class RemoveCompleteFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :complete, :boolean
  end
end
