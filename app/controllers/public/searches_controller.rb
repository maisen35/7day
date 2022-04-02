class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @word = params[:words]
    @range = params[:range]
    if @range == "User"
      @users = User.where("name LIKE(?)", "%#{params[:words]}%").page(params[:page]).per(10)
    else
      @tweets = Tweet.where("tweet LIKE(?)", "%#{params[:words]}%").page(params[:page]).per(10)
    end
  end
end
