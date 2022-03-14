class Admin::TweetsController < ApplicationController
  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to request.referer
  end
end
