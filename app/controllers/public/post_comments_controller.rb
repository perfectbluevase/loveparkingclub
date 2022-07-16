class Public::PostCommentsController < ApplicationController
  
  def create
    parking = Parking.find(params[:parking_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.parking_id = parking.id
    comment.save
    redirect_to  public_parking_path(parking)
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
  
end
