class Game < ApplicationRecord
  belongs_to :user
  attachment :game_image, content_type: ['image/jpeg']
  has_many :post_reviews, dependent: :destroy

  
  def self.search_for(content, method)
    if method == 'perfect'
      Game.where(game_title: content)
    elsif method == 'forward'
      Game.where('game_title LIKE ?', content+'%')
    elsif method == 'backward'
      Game.where('game_title LIKE ?', '%'+content)
    else
      Game.where('game_title LIKE ?', '%'+content+'%')
    end
  end

  
  validates :game_title, presence: true, uniqueness:  {case_sensitive: false}, length: {maximum:25}
  validates :about, presence: true, uniqueness: true, length: {maximum: 200 }
  
end
