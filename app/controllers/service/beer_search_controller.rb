class Service::BeerSearchController < ApplicationController

  def index
    @beer = BeerService.new.beer_by_name(params["name"])
    respond_to do |format|
      format.json { render json: @beer }
    end
  end
end
