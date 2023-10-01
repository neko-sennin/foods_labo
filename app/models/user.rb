class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  enum gender_method: { unentered: 0, male: 1, female: 2, others: 3 }
  enum age_method: { unentered: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies: 7, eighties: 8 }
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
end
