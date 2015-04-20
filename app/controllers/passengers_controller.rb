class PassengersController < ApplicationController

  def index
    render :index
  end

  def new
  end

  def create
  end

  def show
    @user_id = session[:user_id]
    render :dashboard
  end

  def edit
  end

end