class AddCancellationToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :cancellation, :integer
  end
end
