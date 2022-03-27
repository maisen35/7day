module Public::TweetsHelper
  def render_with_hashtags(tweet)
    tweet.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/tweet/hashtag/#{word.delete("#")}"}.html_safe
  end
end
