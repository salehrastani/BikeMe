class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :image

      t.timestamps null: false
    end
  end
end
