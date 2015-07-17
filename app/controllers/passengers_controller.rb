class PassengersController < ApplicationController
  before_action :signed_in?, only: [:dashboard, :update, :logout, :destroy]

  def index
    @passenger = Passenger.new
    render :index
  end

  def new
    @passenger = Passenger.new
    render :new
  end

  def show
  end

  def create
    p "non-permitted params -------------------------------------------"
    p params
    @passenger = Passenger.new(passenger_params)
    p "permitted params -----------------------------------------------"
    p passenger_params
    if @passenger.save
      p "were saved --------------------------------------------"
      render json: @passenger, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def login
    @passenger = Passenger.find_by_email(params[:passenger][:email])
    if @passenger && @passenger.authenticate(params[:passenger][:password])
      render json: @passenger, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def authorize
    redirect_to '/passengers/new' unless current_passenger
  end

  def logout
    # session[:passenger_id] = nil
    redirect_to '/'
  end

  def dashboard
    @passenger =Passenger.find(params[:passenger_id])
    render :dashboard
  end


  def update
    current_passenger.update(passenger_params)
    render json: current_passenger
  end

  # to destroy user
  def destroy
  end



  private
  def passenger_params
    params.permit(:name, :email, :phone_number, :password, :password_confirmation)
  end

end
