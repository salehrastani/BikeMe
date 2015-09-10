class LocationsController < ApplicationController
   # before_action :set_locatable
  def create
    p "*************************************"
    p params
    render json: {lat: "4444", lng: "8888" }
  end

  private
  # def set_locatable
  #   klass = [Member, Dependent].detect{|c| params["#{c.name.underscore}_id"]}
  #   @ratable= klass.find(params["#{klass.name.underscore}_id"])
  # end

end
