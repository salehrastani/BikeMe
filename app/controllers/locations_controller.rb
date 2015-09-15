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
    p "------------------------------"
    p "in single drivers location"
    @driver = current_driver
    render json: @driver.location
  end

  def get_my_drivers_location
    @driver = Driver.find(params[:id])
    render json: @driver.location
  end

  def get_drivers_locations
    if current_driver
       accounting_for_driver = " AND locatable_id != #{current_driver.id}"
     else
      accounting_for_driver = ""
     end
    sql = "SELECT locations.lat, locations.lng, locations.locatable_id FROM drivers inner join locations on drivers.id = locations.locatable_id WHERE locatable_type = 'Driver' AND drivers.active = true" + accounting_for_driver
    query = ActiveRecord::Base.connection.execute(sql)
    if query.values == []
      render nothing: true
    else
      @drivers_locations = {locations: query.values}
      render json: @drivers_locations
    end
  end

  private

  def location_params
    params.permit(:lat, :lng)
  end

end
