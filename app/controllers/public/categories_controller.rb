class Public::CategoriesController < ApplicationController
  
  def index
    @categories = Category.page(params[:page])
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @foods = @category.foods
    end
  end
  
end
