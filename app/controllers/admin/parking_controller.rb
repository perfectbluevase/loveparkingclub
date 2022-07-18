class Admin::ParkingController < ApplicationController
  def index
    @parkings = Parking.all
  end

  def show
  end

  def destroy
  end
end
