class PassengersController < ApplicationController

  def index
    @passenger = Passenger.new
    render :index
  end

  def new
  end

  def create
  end

  def dashboard
    render :dashboard
  end

  def show
  end

  def edit
  end

end