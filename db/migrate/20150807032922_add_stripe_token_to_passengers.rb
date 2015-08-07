class AddStripeTokenToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :stripe_token, :string
  end
end
