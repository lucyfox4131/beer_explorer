class Service::BeerSearchController < ApplicationController

  def index
    @beer = BeerSearch.find_beer(params)
    respond_to do |format|
      format.json { render json: @beer }
    end
  end
end
