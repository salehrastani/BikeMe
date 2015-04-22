class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_passenger
    @current_passenger ||= User.find(session[:passenger_id]) if session[:passenger_id]
  end

  def authorize
    redirect_to '/passengers/new' unless current_passenger
  end


end
