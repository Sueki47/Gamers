class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
  attachment :profile_image, content_type: ['image/jpeg']
  has_many :games, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {minimum: 2 ,maximum:20}
  validates :introduction, length: {maximum: 50 }
end
