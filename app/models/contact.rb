class Contact < ApplicationRecord
  
  belongs_to :user
  
	#バリデーション
	validates :subject, presence: true
	validates :message, presence: true
  
end
