class HomesController < ApplicationController
  def top
  end

  def about
    @tweets = Tweet.all.sample(5)
  end
end
