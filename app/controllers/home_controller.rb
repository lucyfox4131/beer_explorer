class HomeController < ApplicationController
  def show
    @beer = BeerSearch.find_random
  end
end
