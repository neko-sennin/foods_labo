class Public::FoodsController < ApplicationController
  
  def index
    @foods = Food.all
    if params[:category_id].present?
      @foods = @foods.where(category_id: params[:category_id]) 
    end
    @foods = @foods.sort_by { |f| f.review_average_score }.reverse
    @foods = Kaminari.paginate_array(@foods).page(params[:page])
  end

  def show
    @food = Food.find(params[:id])
    #@food = @food.sort_by { |f| f.review_average_score }.reverse
    @food_ingredients = @food.ingredients
  end
  
end
