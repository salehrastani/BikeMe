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
    if @passenger.save
      session[:passenger_id] = @passenger.id
      render :dashboard
    else
      redirect_to 'passenger/new', :notice => "ewww, please try again"
    end
  end

  def login
    @passenger = Passenger.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if params[:password] == @passenger.password
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:passenger_id] = @passenger.id
      render :dashboard
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', :notice => "Invalid login. Try again"
    end
  end

  def authorize
    redirect_to '/passengers/new' unless current_passenger
  end

  def logout
    session[:user_id] = nil
    redirect_to 'passengers/login'
  end

  def dashboard
    render "/passengers/#{@passenger.id}/dashboard"
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