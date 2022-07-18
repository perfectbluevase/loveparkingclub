class Public::BookmarksController < ApplicationController

  #ユーザーのログイン状態を確認し該当しない場合はログインページにリダイレクト
  before_action :authenticate_user!
  
  def create
    @parking = Parking.find(params[:parking_id])
    bookmark = @parking.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @parking = Parking.find(params[:parking_id])
    bookmark = @parking.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present? #２度押しのエラーを回避
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
