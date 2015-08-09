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

  def stripe
    p "-------------------------------------"
    p params[:token]
    p current_driver
    @driver = current_driver
    p @driver.stripe_token
    @driver.stripe_token = params[:token]
    p @driver.stripe_token
    p "we got to the bottom of the action ----------------------------"
    render json: @driver
  end

  def update
    current_driver.update(driver_params)
    render json: current_driver
  end



  private
  def driver_params
    params.permit(:name, :email, :password, :phone_number, :password_confirmation)
  end

  def stripe_token_params
    params.permit(:token)
  end

end
