class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(revew_params)
    if @review.save
      flash[:notice] = "新規投稿が完了しました"
      redirect_to review_path(@review.id)
    else
      flash[:alert] = "新規登録内容に不備があります"
      render :new
    end
  end

  def index
    @reviews = Review.page(params[:page])
    @reviews_all = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash.now[:success] = "新規投稿の変更が完了しました"
      redirect_to review_path(@review.id)
    else
      flash.now[:danger] = "新規登録の変更内容に不備があります"
      render :edit
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "選択された投稿を削除しました"
    render_to reviews_path
  end
  
  
  private
  def review_params
    params.require(:review).permit(:user_id, :food_id, :title, :period, :period_amount, :intake, :intake_amount, :comment, :star, { tad_ids: [] })
  end
  
end
