class DriversController < ApplicationController
  before_action :signed_in_driver?, only: [:dashboard, :update, :logout, :destroy]

  def index
    @driver = Driver.new
    render json: @driver
  end

  def new
    @driver = Driver.new
    render json: @driver
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      render json: @driver, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def show
  end

  def login
    @driver = Driver.find_by_email(driver_params[:email])
    if @driver && @driver.authenticate(driver_params[:password])
      render json: @driver, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def dashboard

    render json: current_driver
  end

  def update
    current_driver.update(driver_params)
    render json: current_driver
  end



  private
  def driver_params
    params.require(:driver).permit(:name, :email, :password, :phone_number, :password_confirmation)
  end

end
