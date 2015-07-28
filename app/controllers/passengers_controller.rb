class PassengersController < ApplicationController
  before_action :signed_in?, only: [:dashboard, :update, :logout, :destroy]

  def index
    @passenger = Passenger.new
    render json: @passenger
  end

  def new
    @passenger = Passenger.new
    render json: @passenger
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      render json: @passenger, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def show
  end

  def login
    @passenger = Passenger.find_by_email(passenger_params[:email])
    if @passenger && @passenger.authenticate(passenger_params[:password])
      render json: @passenger, status: 200
    else
      render nothing: true, status: 401
    end
  end


  def dashboard
    render json: current_passenger
  end

  def update
    current_passenger.update(passenger_params)
    render json: current_passenger
  end




  private
  def passenger_params
    params.permit(:name, :email, :phone_number, :password, :password_confirmation)
  end

end
