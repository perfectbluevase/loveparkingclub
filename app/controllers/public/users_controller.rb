class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parkings = @user.parkings
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path
    else
      render :edit
    end
  end
  
  def confirm
    @user = User.find_by(params[:id])
  end
  
  def delete_user
    @user = User.find_by(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました！"
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_image, :age_type, :living_prefecture, :biography)
  end
  
end
