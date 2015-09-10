class AddCancellationToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :cancellation, :integer
  end
end
