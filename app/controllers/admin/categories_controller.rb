class Admin::CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリの登録が完了しました"
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "カテゴリの新規登録内容に不備があります"
      render :new
    end
  end

  def index
    @categories = Category.page(params[:page])
    @categories_all = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash.now[:success] = "カテゴリ詳細の変更が完了しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリ詳細の変更内容に不備があります"
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "選択されたカテゴリを削除しました"
    redirect_to admim_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
