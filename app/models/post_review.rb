class PostReview < ApplicationRecord
  belongs_to :user
  belongs_to :game
  attachment :review_image
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :review_title, presence: true
  validates :opinion, presence: true, uniqueness:  {case_sensitive: false}
end
