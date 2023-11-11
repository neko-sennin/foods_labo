class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save!
      flash[:notice] = "新規投稿が完了しました"
      redirect_to review_path(@review.id)
    else
      flash[:alert] = "新規登録内容に不備があります"
      render :new
    end
  end

  def index
    @reviews =
      if params[:tag_id].present?
        Tag.find(params[:tag_id]).reviews
      else
        Review.all
      end
    @reviews = @reviews.search(params[:keyword]) if params[:keyword]
    @reviews = @reviews.order(created_at: :desc).page(params[:page])
  end

  def show
    @review = Review.find_by(id: params[:id]) 
    @review_tags = @review.tags
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to reviews_path
    end
  end
  
  def update
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to reviews_path
    end
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
    redirect_to reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:user_id, :food_id, :title, :period, :period_amount, :intake, :intake_amount, :comment, :star, { tag_ids: [] })
  end
  
end
