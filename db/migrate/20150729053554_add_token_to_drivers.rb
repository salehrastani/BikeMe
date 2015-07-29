class AddTokenToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :token, :string
  end
end
