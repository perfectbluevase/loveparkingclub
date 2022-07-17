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
  
  def delete_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def confirm
    @user = User.find_by(user_name: params[:user_name])
    @user.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_image, :age_type, :living_prefecture, :biography)
  end
  
end
