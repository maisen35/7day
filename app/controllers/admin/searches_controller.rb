class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @word = params[:words]
    @range = params[:range]
    if @range == "User"
      @users = User.where("name LIKE(?)", "%#{params[:words]}%").page(params[:page]).per(10)
    elsif @range == "Tweet"
      @tweets = Tweet.where("tweet LIKE(?)", "%#{params[:words]}%").page(params[:page]).per(10)
    else
      @contacts = Contact.where("message LIKE(?)", "%#{params[:words]}%").page(params[:page]).per(10)
    end
  end
end
