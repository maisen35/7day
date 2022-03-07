class Tweet < ApplicationRecord
  MAX_TWEETS_COUNT = 7
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tweet, presence: true
  validate :tweets_count_must_be_within_limit
  # validate :tweets_count_one_day_limit


  def favorited_by?(user)
    likes.exists?(user_id: user.id)
  end

  private

  def tweets_count_must_be_within_limit
    errors.add(:base, "投稿は七回までです") if user.tweets.count >= MAX_TWEETS_COUNT
  end

  # def tweets_count_one_day_limit
    # errors.add(:date, "本日は投稿できません") if user.tweets.created_at == Date.today
  # end
end
