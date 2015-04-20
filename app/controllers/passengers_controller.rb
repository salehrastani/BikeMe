class PassengersController < ApplicationController

  def index
    @passenger = Passenger.new
    render :index
  end

  def new
  end

  def create
    redirect_to :dashboard
  end

  def dashboard
    render :dashboard
  end

  def show
  end

  def edit
  end

end