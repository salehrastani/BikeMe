class LocationsController < ApplicationController
   # before_action :location_params
  def create_passenger_location
    @passenger = current_passenger
    @passenger.create_location(location_params)
    render json: @passenger.location
  end

  def create_driver_location
    @driver = current_driver
    @driver.create_location(location_params)
    render json: @driver.location
  end

  def passenger_location
    @passenger = current_passenger
    render json: @passenger.location
  end

  def driver_location
    @driver = current_driver
    render json: @driver.location
  end

  private

  def location_params
    params.permit(:lat, :lng)
  end

end
