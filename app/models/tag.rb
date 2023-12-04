class Tag < ApplicationRecord
  
  has_many :review_tags, dependent: :destroy
  has_many :reviews, through: :review_tags
  
  validates :name, presence: true
  
  def ranking_hash
    grouped_reviews = reviews.group_by(&:food_id)
    average_hash = grouped_reviews.map do |id, reviews|
      total_score = reviews.sum(&:star)
      average_score = total_score / reviews.size
      [id, average_score]
    end.to_h
   average_hash.sort_by { |key, value| value }.reverse.to_h
  end
  
end
