class Service::BrewerySearchController < ApplicationController

  def index
    @brewery = BrewerySearch.find_by(params)
    respond_to { |format| format.json { render json: @brewery } }
  end
end
