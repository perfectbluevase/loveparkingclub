class Public::ParkingsController < ApplicationController

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    if @parking.save
    @parking.create_tags
    redirect_to public_parking_path(@parking.id)
    else
    render :new
    end
  end

  def edit
    @parking = Parking.find(params[:id])
  end

  def update
    @parking = Parking.find(params[:id])
    if @parking.update(parking_params)
     @parking.update_tags
    redirect_to public_parking_path
    else
    render :edit
    end
   
  end

  def index
    # hash_tagというURLパラメーターが存在していれば
    @parkings = if params[:oreno_hash_tag].present?
      tag = Tag.find_by(name: params[:oreno_hash_tag])
      if tag.present?
        tag.parkings
      else
        flash.now[:notice] = "Sorry! There is no post having this tag."
        Parking.none
      end
    else
      # Parking.all
      redirect_to root_path
    end
  end

  def show
    @parking = Parking.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    redirect_to root_path
  end

  private

  def parking_params
    params.require(:parking).permit(:parking_name, :image, :parking_address, :parking_operator, :parking_fee_info, :parking_review, :input_tag)
  end


end
