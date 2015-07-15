class AddTokenToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :token, :string
  end
end
