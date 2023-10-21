class User < ApplicationRecord
  
  has_many :reviews
  has_many :likes
  
  has_one_attached :image
  
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io:File.open(file_path), filename:'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
  
  enum gender: { unentered: 0, male: 1, female: 2, other: 3 }, _prefix: true
  enum age: { unentered: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies: 7, eighties: 8 }, _prefix: true
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
end
