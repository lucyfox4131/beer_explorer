class BeersController < ApplicationController

  def index  
  end

  def show
    @beer = Beer.find_beer(params["id"])
  end
end
