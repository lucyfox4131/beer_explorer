class RatedBeersController < ApplicationController
  def create
    if !current_user
      flash["error"] = "Please login to rate this beer"
    else
      beer = RatedBeer.rate(params["id"], params["rate"], current_user)
      if beer
        RecommendationGeneratorWorker.perform_async(params["rate"], beer.api_id, current_user.id)
        flash["success"] = "You've rated #{params["name"]}"
      else
        flash["error"] = "Beer was not rated."
      end
    end
    redirect_to beer_path(params["id"])
  end
end
