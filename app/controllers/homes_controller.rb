class HomesController < ApplicationController
  def top
  end

  def about
    @tweets = Tweet.all.sample(8)
  end
end
