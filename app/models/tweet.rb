class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tweet, presence: true

  def favorited_by?(user)
    likes.exists?(user_id: user.id)
  end
end
