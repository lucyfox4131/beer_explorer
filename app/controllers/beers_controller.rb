class BeersController < ApplicationController
  def show
    @beer = Beer.find_beer(params["id"])
  end
end
