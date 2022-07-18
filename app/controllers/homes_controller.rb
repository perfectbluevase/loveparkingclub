class HomesController < ApplicationController
  def top
    # hash_tagというURLパラメーターが存在していれば
    @parkings = if params[:oreno_hash_tag].present?
      tag = Tag.find_by(tag_name: params[:oreno_hash_tag])
      if tag.present?
        tag.parkings
      else
        flash.now[:notice] = "該当のタグはありません。"
        Parking.none
      end
    else
      Parking.all
    end
  end

  def about
  end

  def index
  end

  def show
  end
end
