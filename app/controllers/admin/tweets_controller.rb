class Admin::TweetsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tweets = Tweet.page(params[:page]).per(10)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to admin_tweets_path
  end
end
