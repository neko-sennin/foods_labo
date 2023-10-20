class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  has_many :tags
  
  enum period_method: { unentered: 0, date: 1, week: 2, month: 3, year: 4 }, _prefix: true
  enum intake_method: { unentered: 0, piece: 1, gram: 2, liter: 3 }, _prefix: true
  
end
