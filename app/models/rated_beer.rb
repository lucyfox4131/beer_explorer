class RatedBeer < ApplicationRecord
  has_many :user_rated_beers
  has_many :users, through: :user_rated_beers
  belongs_to :rated_brewery

  def self.service
    @service = BeerService.new
  end

  def self.rate(beer_id, rating, current_user)
    beer = RatedBeer.find_by(api_id: beer_id)
    if beer
      UserRatedBeer.find_rated_beer(beer.id, rating, current_user.id)
    else
      data = service.find_beer_with_breweries(beer_id)["data"]
      create_ratings(data)
      # service.#get beer with the brewery information, create a rated brewery, create a rated beer, create new user rated beer
    end

    #is there a user rated beer existing that has both beer id and current user
    #if this is true, update the rating, else create new one
    #when creating new one we must first create the rated brewery with brew info, then the beer, then the user rated beer
    # probably a good idea for most of this to be wrapped within some sort of a context block so that we know it all succeeds

  end

  def self.create_ratings(data)
    brewery = RatedBrewery.create_new(data["brewery"])
    create_rated_beer(data)
  end

  def self.create_rated_beer(data)
    # RatedBrewery.create()
  end

end
