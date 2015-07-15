class ApplicationController < ActionController::API

  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session

  private

    def current_passenger
      @current_passenger ||= Passenger.find_by(email: request.headers["email"])
    end
    helper_method :current_passenger

    def signed_in?
     @passenger = Passenger.find_by(email: request.headers["email"])
     if @passenger && @passenger.token = request.headers["token"]
       true
     else
       render nothing: true, status: 401
     end
    end
    helper_method :signed_in?


end
