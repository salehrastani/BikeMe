class PassengersController < ApplicationController

  def index
    @passenger = Passenger.new
    render :index
  end

  def new
    @passenger = Passenger.new
    render :new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if passenger.save
      session[:passenger_id] = @passenger.id
      redirect_to "/passengers/#{passenger.id}/dashboard"
    else
      redirect_to 'passenger/new'
    end
  end

  def login
    authorize
  end

  def authorize
    redirect_to '/passengers/new' unless current_passenger
  end

  def logout
    session[:user_id] = nil
    redirect_to 'passengers/login'
  end

  def dashboard
    render "/passengers/#{passenger.id}/dashboard"
  end

  def show
  end

  def edit
  end

  private
  def passenger_params
    params.require(:passenger).permit(:name, :email, :password, :password_confirmation)
  end

end