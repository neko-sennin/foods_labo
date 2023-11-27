class Admin::CategoriesController < ApplicationController
  
  def create
    @categories = Category.page(params[:page])
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, flash: {success: "カテゴリの登録が完了しました。"}
    else
      flash.now[:danger] = "カテゴリの新規登録内容に不備があります。"
      render :index
    end
  end

  def index
    @category = Category.new
    @categories = Category.page(params[:page])
    @categories_all = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, flash: {success: "カテゴリの変更が完了しました。"}
    else
      flash.now[:danger] = "カテゴリの変更内容に不備があります。"
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "選択されたカテゴリを削除しました。"
    redirect_to admin_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end
