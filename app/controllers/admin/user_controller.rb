class Admin::UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @parkings = @user.parkings
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました！"
    redirect_to admin_user_index_path
  end
  
  def delete_user
    #@user = User.find_by(params[:id])
    @user = User.find(params[:user_id])
    @user.update(is_deleted: true)
    # @user.update_status_destroy
    # @user.destroy
    reset_session
    flash[:notice] = "会員ステータスを退会済みにしました"
    redirect_to admin_user_index_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_image, :age_type, :living_prefecture, :biography)
  end

end
