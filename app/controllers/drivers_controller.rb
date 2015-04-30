class DriversController < ApplicationController

  def index
    @driver = Driver.new
    render :index
  end

  def new
    @driver = Driver.new
    render :new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      session[:driver_id] = @driver.id
      render :dashboard
    else
      redirect_to 'driver/new', :notice => "ewww, please try again"
    end
  end

  def login
    @driver = Driver.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if params[:password] == @driver.password
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:driver_id] = @driver.id
      render :dashboard
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', :notice => "Invalid login. Try again"
    end
  end

  def authorize
    redirect_to '/drivers/new' unless current_driver
  end

  def logout
    session[:user_id] = nil
    redirect_to 'drivers/login'
  end

  def dashboard
    render "/drivers/#{@driver.id}/dashboard"
  end

  def show
  end

  def update
  end

  # to destroy user
  def destroy
  end



  private
  def driver_params
    params.require(:driver).permit(:name, :email, :password, :password_confirmation)
  end

end