class HomeController < ApplicationController
  def show
    featured  = FeaturedBeer.featured
    @brewery  = featured[:brewery]
    @beer     = featured[:beer]
  end
end
