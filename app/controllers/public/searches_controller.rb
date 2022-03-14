class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.where("name LIKE(?)", "%#{params[:words]}%")
    else
      @tweets = Tweet.where("tweet LIKE(?)", "%#{params[:words]}%")
    end
  end
end
