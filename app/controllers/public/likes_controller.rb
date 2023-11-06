class Public::LikesController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    like = current_user.likes.new(review_id: review.id)
    like.save
    redirect_to review_path(review)
  end
  
  def index
    @likes = Like.page(params[:page])
    @likes_all = Like.all
  end
  
  def destroy
    review = Review.find(params[:review_id])
    like = current_user.likes.find_by(review_id: review.id)
    like.destroy
    redirect_to review_path(review)
  end
  
end
