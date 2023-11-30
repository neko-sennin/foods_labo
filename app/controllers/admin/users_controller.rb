class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
    @users_all = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "会員情報を変更しました"
    redirect_to admin_user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :email, :gender, :age, :introduction, :is_active)
  end
  
end
