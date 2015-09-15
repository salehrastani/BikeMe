class AddCompleteToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :complete, :boolean, default: false
  end
end
