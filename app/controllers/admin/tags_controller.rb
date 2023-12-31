class Admin::TagsController < ApplicationController
  
  def create
    @tags = Tag.page(params[:page])
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, flash: {success: "タグの登録が完了しました。"}
    else
      flash.now[:danger] = "タグの新規登録内容に不備があります。"
      render :index
    end
  end

  def index
    @tag = Tag.new
    @tags = Tag.page(params[:page])
    @tags_all = Tag.all
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path, flash: {success: "タグの変更が完了しました。"}
    else
      flash.now[:danger] = "タグの変更内容に不備があります。"
      render :edit
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:success] = "選択されたタグを削除しました。"
    redirect_to admin_tags_path
  end
  
  private
  def tag_params
    params.require(:tag).permit(:name)
  end
  
end
