class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  has_many :likes, dependent: :destroy
  has_many :review_tags
  has_many :tags, through: :review_tags
  
	validates :title, presence: true
	validates :comment, presence: true
	validates :star, presence: true
  
  enum period_amount: { unentered: 0, date: 1, week: 2, month: 3, year: 4 }, _prefix: true
  enum intake_amount: { unentered: 0, piece: 1, gram: 2, liter: 3 }, _prefix: true
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  def self.search(keyword)
    where("comment LIKE ?", "%#{keyword}%")
  end
  
end
