class Tag < ApplicationRecord
  
  has_many :review_tags
  has_many :reviews, through: :review_tags
  
  validates :name, presence: true
  
end
