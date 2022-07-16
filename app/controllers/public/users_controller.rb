class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parkings = @user.parkings
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path
  end

  def confirm
  end
  
  def mypage
    @bookmarks = Bookmark.where(user.id: current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_image, :age_type, :living_prefecture, :biography)
  end
  
end
