class RatedBeersController < ApplicationController
  def create
    if !current_user
      flash["error"] = "Please login to rate this beer"
    else
      beer = RatedBeer.rate(params["id"], params["rate"], current_user)
      if beer
        # background worker process will go here, pass it rate, id, current_user
        flash["success"] = "You've rated #{params["name"]}"
      else
        flash["error"] = "Beer was not rated."
      end
    end
    redirect_to beer_path(params["id"])
  end
end
