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
  
  def edit
    @parking = Parking.find(params[:id])
  end
  
  def update
    @parking = Parking.find(params[:id])
    @parking.update(parking_params)
    redirect_to public_parking_path
  end

  def index
    @parkings = Parking.all
  end

  def show
    @parking = Parking.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    redirect_to public_parking_path
  end

  private

  def parking_params
    params.require(:parking).permit(:parking_name, :image, :parking_address, :parking_operator, :parking_fee_info, :parking_review)
  end


end
