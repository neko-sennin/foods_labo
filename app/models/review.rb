class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  has_many :review_tags
  has_many :tags, through: :review_tags
  
  enum period_amount: { unentered: 0, date: 1, week: 2, month: 3, year: 4 }, _prefix: true
  enum intake_amount: { unentered: 0, piece: 1, gram: 2, liter: 3 }, _prefix: true
  
  def self.search(keyword)
    where("facility_name LIKE ?", "%#{keyword}%")
  end
  
end
