class RatedBeersController < ApplicationController
  def create
    beer = RatedBeer.rate(params["id"], params["rate"], current_user)
    flash["success"] = "You've rated #{params["name"]}"
    redirect_to beer_path(params["id"])
  end
end
