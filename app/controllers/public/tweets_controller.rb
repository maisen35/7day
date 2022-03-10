class Public::TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to thanks_path
    else
      render :new
    end
  end

  def index
    @tweets = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(3).pluck(:tweet_id)) # いいね0は呼び出せない要改善
  end

  def show
    @tweet = Tweet.find(params[:id])
    @likes = @tweet.likes.page(params[:page])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
