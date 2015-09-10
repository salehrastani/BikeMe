class AddRatableIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :ratable_id, :integer
  end
end
