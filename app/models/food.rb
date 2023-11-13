class Food < ApplicationRecord
  
  belongs_to :category
  has_many :reviews
  has_many :food_ingredients
  has_many :ingredients, through: :food_ingredients
  
  has_one_attached :image
  
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io:File.open(file_path), filename:'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
  
  def review_average_score
    reviews.average(:star).to_f.round(1)
  end
  
end
