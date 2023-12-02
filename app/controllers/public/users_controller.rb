class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path, flash: {success: "プロフィールの変更が完了しました。"}
    else
      flash.now[:danger] = "プロフィールの変更内容に不備があります。"
      render :edit
    end
  end
  
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: true)
    sign_out(current_user)
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to root_path
  end
  
  def likes
    @user = User.find(params[:user_id])
    likes = Like.where(user_id: current_user.id).pluck(:review_id)
    @like_list = Review.find(likes)
  end
  
  private
  def user_params
    params.require(:user).permit(:image, :name, :email, :gender, :age, :introduction)
  end
  
end
