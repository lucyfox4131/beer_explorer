class Service::BeerSearchController < ApplicationController

  def index
    @beer = BeerSearch.find_beer(params)
    respond_to { |format| format.json { render json: @beer } }
  end
end
