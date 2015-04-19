# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'faker'

5.times do
  Passenger.create(name: Faker::Name.name, email: Faker::Internet.email,)
end

# 5.times do
#   Driver.create()
# end

# drivers = Driver.all

# drivers.each do |driver|
# driver.vehicles.create(make: "honda", model: "civic", driver_id: driver.id)
# end

