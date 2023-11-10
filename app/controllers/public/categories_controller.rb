class Public::CategoriesController < ApplicationController
  
  def index
    @categories = Category.page(params[:page])
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @foods = @category.foods
    end
  end
  
end
