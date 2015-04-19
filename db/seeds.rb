# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'faker'

5.times do
  Passenger.create(name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
end

5.times do
  Driver.create(name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
end

5.times do
  Trip.create(origin: Faker::Address.street_address, destination: Faker::Address.street_address, price: Faker::Commerce.price)
end

trips = Trip.all
passengers = Passenger.all
drivers = Driver.all

vehicle_model = ["civic", "accord", "jcruiser", "m5", "sonata"]
vehicle_make = ["honda", "honda", "toyota", "bmw", "hyundai"]

drivers.each_with_index do |driver, index|
  driver.vehicles.create(make: vehicle_make[index], model: vehicle_model[index], driver_id: driver.id)
  driver.trips = [trips[index]]
end

passengers.each_with_index do |passenger, index|
  passenger.trips = [trips[index]]
end