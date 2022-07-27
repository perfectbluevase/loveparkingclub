class Admin::ParkingController < ApplicationController
  def index
    @parkings = Parking.all
  end

  def show
  end

  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    redirect_to admin_parking_index_path
  end
end
