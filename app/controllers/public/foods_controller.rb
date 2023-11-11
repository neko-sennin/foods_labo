class Public::FoodsController < ApplicationController
  
  def index
    @foods = Food.all
    if params[:category_id].present?
      @foods = @foods.where(category_id: params[:category_id]) 
    end
    @foods.page(params[:page])
  end

  def show
    @food = Food.find(params[:id])
    @food_ingredients = @food.ingredients
  end
  
end
