class RemoveOriginFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :origin, :string
  end
end
