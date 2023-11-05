class Public::FoodsController < ApplicationController
  
  def index
    @foods = Food.page(params[:page])
    @foods_all = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @food_ingredients = @food.ingredients
  end
  
end
