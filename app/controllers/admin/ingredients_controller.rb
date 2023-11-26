class Admin::IngredientsController < ApplicationController
  
  def create
    @ingredients = Ingredient.page(params[:page])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "成分の登録が完了しました"
      redirect_to admin_ingredients_path
    else
      render :index
    end
  end
  
  def index
    @ingredient = Ingredient.new
    @ingredients = Ingredient.page(params[:page])
    @ingredients_all = Ingredient.all
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash.now[:success] = "成分詳細の変更が完了しました"
      redirect_to admin_ingredients_path
    else
      render :edit
    end
  end
  
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    flash[:success] = "選択された成分を削除しました"
    redirect_to admim_ingredients_path
  end
  
  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  
end
