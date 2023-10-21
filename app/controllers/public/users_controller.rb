class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end
  
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:image, :name, :email, :gender, :age, :introduction)
  end
  
end
