class TripsController < ApplicationController

  def index
    @driver = current_driver
    @trips = Trip.where(driver_id: @driver.id, accepted:nil)
    if @trips == []
      render json: true
    else
      render json: @trips
    end
  end

  def create
    p "--------------------------------------------"
    p params
    @passenger = current_passenger
    @trip = @passenger.trips.new(trip_params)
      if @trip.save
        render json: @trip
      else
        render nothing: true
      end
  end

  def update
  end

  private
    def trip_params
      params.permit(:origin, :destination, :price, :duration, :driver_id, :complete, :accepted)
    end

end
