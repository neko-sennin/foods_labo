class Public::LikesController < ApplicationController
  
  def cerate
    review = Review.find(params[:review_id])
    like = current_user.like.new(review_id: review_id)
    like.save
    redirect_to review_path(review)
  end
  
  def index
    @likes = Like.page(params[:page])
    @likes_all = Like.all
  end
  
  def destroy
    review = Review.find(params[:review_id])
    like = current_user.like.find_by(review_id: review_id)
    like.destroy
    redirect_to review_path(review)
  end
  
end
