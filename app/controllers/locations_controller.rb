class LocationsController < ApplicationController
   # before_action :location_params
  def set_passenger_location
    @passenger = current_passenger
    if @passenger.location.nil?
      @passenger.create_location(location_params)
    else
      @passenger.location.update_attributes(location_params)
    end
    render json: @passenger.location
  end

  def set_driver_location
    @driver = current_driver
    if @driver.location.nil?
      @driver.create_location(location_params)
    else
      @driver.location.update_attributes(location_params)
    end
    render json: @driver.location
  end

  def get_passenger_location
    @passenger = current_passenger
    render json: @passenger.location
  end

  def get_driver_location
    @driver = current_driver
    render json: @driver.location
  end

  def get_drivers_locations
    sql = "SELECT locations.lat, locations.lng FROM drivers inner join locations on drivers.id = locations.locatable_id WHERE locatable_type = 'Driver' AND drivers.active = true"
    query = ActiveRecord::Base.connection.execute(sql)
    if @drivers_locations.count >= 1
      p "---------------------------------------"
      p query.values
      @drivers_locations = {locations: query.values}
      render json: @drivers_locations
    else
      p "++++++++++++++++++++++++++++++++++++++"
      p query.values
      render nothing: true
    end
  end

  private

  def location_params
    params.permit(:lat, :lng)
  end

end
