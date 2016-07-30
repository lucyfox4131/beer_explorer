class RatedBeersController < ApplicationController
  def create
    # beer = UserRatedBeer.rate_beer(params["id"], params["rate"], current_user)
    flash["success"] = "You've rated #{params["name"]}"
    redirect_to beer_path(params["id"])
  end
end
