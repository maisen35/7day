class Hashtag < ApplicationRecord
  has_many :tweet_hashtag_relations, dependent: :destroy
  has_many :tweets, through: :tweet_hashtag_relations, dependent: :destroy
  validates :hashname, presence: true, length: { maximum:10 }
end
