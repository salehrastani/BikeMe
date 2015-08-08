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
    p "-----------------------------------------------------"
    p "we are in the create method"
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
    current_driver.stripe_token = stripe_token_params[:token]
    render json: current_driver.stripe_token
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
