class ApplicationController < ActionController::API

  include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :null_session

  private

    def current_passenger
      @current_passenger ||= Passenger.find_by(email: request.headers["email"])
    end
    helper_method :current_passenger

    def signed_in_passenger?
     @passenger = Passenger.find_by(email: request.headers["email"])
     if @passenger && @passenger.token = request.headers["token"]
       true
     else
       render nothing: true, status: 401
     end
    end
    helper_method :signed_in_passenger?


    def current_driver
      p "in curren_driver method --------------------------------"
      p request.headers
      @current_driver ||= Driver.find_by(email: request.headers["email"])
    end
    helper_method :current_driver

    def signed_in_driver?
     @driver = Driver.find_by(email: request.headers["email"])
     if @driver && @driver.token = request.headers["token"]
       true
     else
       render nothing: true, status: 401
     end
    end
    helper_method :signed_in_driver?

end
