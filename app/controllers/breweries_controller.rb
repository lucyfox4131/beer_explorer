class BreweriesController < ApplicationController
  def index
  end

  def show
    @brewery = Brewery.find(params["id"])
  end
end
