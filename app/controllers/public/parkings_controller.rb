class Public::ParkingsController < ApplicationController

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    @parking.save
    redirect_to public_parkings_path
  end

  def index
    @parkings = Parking.all
  end

  def show
  end

  def destroy
  end

  private

  def parking_params
    params.require(:parking).permit(:parking_name, :image, :parking_address, :parking_operator, :parking_fee_info, :parking_review)
  end


end
