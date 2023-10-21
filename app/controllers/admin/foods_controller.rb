class Admin::FoodsController < ApplicationController
  
  def new
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = "食材の新規登録が完了しました"
      redirect_to admin_food_path(@food.id)
    else
      flash.now[:alert] = "食材の新規登録内容に不備があります"
      render :new
    end
  end

  def index
    @foods = Food.page(params[:page])
    @foods_all = Food.all
  end
  
  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end
  
  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash.now[:success] = "食材詳細の変更が完了しました"
      redirect_to admin_foods_path
    else
      flash.now[:danger] = "食材詳細の変更内容に不備があります"
      render :edit
    end
  end
  
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = "選択された食材を削除しました"
    redirect_to admim_foods_path
  end
  
  private
  def food_params
    params.require(:food).permit(:category_id, :image, :name)
  end
  
end
