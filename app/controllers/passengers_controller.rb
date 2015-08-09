class PassengersController < ApplicationController
  before_action :signed_in_passenger?, only: [:dashboard, :update, :logout, :destroy]

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
    @passenger = current_passenger
    render json: @passenger
  end

 def stripe
    @passenger = current_passenger
    @passenger.stripe_token = params[:stripe_token]
    render json: @passenger
  end

  def update
    @passenger = current_passenger
    @passenger.update(passenger_params)
    render json: @passenger
  end



  private
  def passenger_params
    params.permit(:name, :email, :phone_number, :password, :password_confirmation)
  end

end
