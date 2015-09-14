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
    @driver = current_driver
    render json: @driver
  end

  def stripe
    @driver = current_driver
    @driver.stripe_token = params[:stripe_token]
    render json: @driver
  end

  def update
    @driver = current_driver
    @driver.update(driver_params)
    render json: @driver
  end

  def activate
    @driver = current_driver
    if @driver.active == false
      @driver.update(driver_params)
    else
      @driver.update(driver_params)
    end
    render json: @driver.active
  end

  private
  def driver_params
    params.permit(:name, :email, :password, :phone_number, :password_confirmation, :active)
  end

end
