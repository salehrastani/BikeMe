class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :image

      t.timestamps null: false
    end
  end
end
