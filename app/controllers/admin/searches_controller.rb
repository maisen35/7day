class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.where("name LIKE(?)", "%#{params[:words]}%")
    elsif @range == "Tweet"
      @tweets = Tweet.where("tweet LIKE(?)", "%#{params[:words]}%")
    else
      @contacts = Contact.where("message LIKE(?)", "%#{params[:words]}%")
    end
  end
end
