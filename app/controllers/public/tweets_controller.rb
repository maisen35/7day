class Public::TweetsController < ApplicationController
  before_action :authenticate_user!
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
    @tweets = Tweet.includes(:user).limit(10).sort {|a,b|
    b.likes.size <=>
    a.likes.size
    }
  end

  def show
    @tweet = Tweet.find(params[:id])
    @likes = @tweet.likes.page(params[:page]).includes(:user)
  end

  def hashtag
    @tag = Hashtag.find_by(hashname: params[:name])
    @tweets = @tag.tweets.page(params[:page]).per(9)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
