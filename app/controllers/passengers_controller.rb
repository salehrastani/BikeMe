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
    passenger = Passenger.new(passenger_params)
    if passenger.save
      session[:passenger_id] = passenger.id
      redirect_to passenger_dashboard_path(passenger.id)
    else
      redirect_to 'passenger/new', :notice => "ewww, please try again"
    end
  end

  def login
    passenger = Passenger.find_by_email(params[:passenger][:email])
    if passenger && passenger.authenticate(params[:passenger][:password])
      session[:passenger_id] = passenger.id
      redirect_to passenger_dashboard_path(passenger.id)
    else
      redirect_to '/passengers/new', :notice => "Invalid login. Try again"
    end
  end

  def authorize
    redirect_to '/passengers/new' unless current_passenger
  end

  def logout
    session[:passenger_id] = nil
    redirect_to '/'
  end

  def dashboard
    @passenger = Passenger.find(session[:passenger_id])
    render :dashboard
  end

  def show

  end

  def update
  end

  # to destroy user
  def destroy
  end



  private
  def passenger_params
    params.require(:passenger).permit(:name, :email, :password, :password_confirmation)
  end

end