class AddActiveToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :active, :boolean, default: false
  end
end
