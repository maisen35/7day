class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :tweet_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :tweet_hashtag_relations, dependent: :destroy
  
  validates :tweet, presence: true, length: { maximum: 140 }
  validate :tweets_count_must_be_within_limit
  validate :tweets_count_one_day_limit

  after_create do
    tweet = Tweet.find_by(id: self.id)
    hashtags = self.tweet.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tweet.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      tweet.hashtags << tag
    end
  end

  def favorited_by?(user)
    likes.exists?(user_id: user.id)
  end

  private

  def tweets_count_must_be_within_limit
    errors.add(:base, "投稿は七回までです") if user.tweets.count >= 7
  end

  def tweets_count_one_day_limit
    # byebug
    errors.add(:base, "本日は投稿できません") if user.tweets.length > 0 && user.tweets.last.created_at.day == Date.today.day && user.tweets.last.created_at.month == Date.today.month && user.tweets.last.created_at.year == Date.today.year
  end
end
