class Contact < ApplicationRecord
  
  belongs_to :user
  
	#バリデーション
	validates :title, presence: true
	validates :email, presence: true
  
end
