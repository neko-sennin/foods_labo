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
    @reviews = Review.page(params[:page])
    @reviews_all = Review.all
    if params[:new_review]
      @reviews = Review.new_review
    elsif params[:old_review]
      @reviews = Review.old_review
    else
      @reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviews : Review.all
    end
    if params[:keyword]
      @reviews = @reviews.search(params[:keyword]).page(params[:page])
    else
      @reviews = @reviews.page(params[:page])
    end
    @keyword = params[:keyword]
  end

  def show
    @review = Review.find_by(id: params[:id]) 
    @review_tags = @review.tags
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
    redirect_to reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:user_id, :food_id, :title, :period, :period_amount, :intake, :intake_amount, :comment, :star, { tag_ids: [] })
  end
  
end
