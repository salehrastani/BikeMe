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
    driver = Driver.new(driver_params)
    if driver.save
      session[:driver_id] = driver.id
      redirect_to driver_dashboard_path(driver.id)
    else
      redirect_to 'driver/new', :notice => "ewww, please try again"
    end
  end

  def login
    driver = Driver.find_by_email(params[:passenger][:email])
    if driver && driver.authenticate(params[:driver][:password])
      session[:driver_id] = driver.id
      redirect_to driver_dashboard_path(driver.id)

    else
      redirect_to '/drivers/new', :notice => "Invalid login. Try again"
    end
  end

  def authorize
    redirect_to '/drivers/new' unless current_driver
  end

  def logout
    session[:driver_id] = nil
    redirect_to 'drivers/login'
  end

  def dashboard
    @driver = Driver.find(session[:driver_id])
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
  def driver_params
    params.require(:driver).permit(:name, :email, :password, :password_confirmation)
  end

end