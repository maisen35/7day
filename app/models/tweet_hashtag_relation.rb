class TweetHashtagRelation < ApplicationRecord
  belongs_to :tweet
  belongs_to :hashtag
end
