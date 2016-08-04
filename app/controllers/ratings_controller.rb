class RatingsController < ApplicationController
  def index
    @liked = UserRatedBeer.liked
    @disliked = UserRatedBeer.disliked
  end
end
