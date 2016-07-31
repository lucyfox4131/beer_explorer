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
      user_rating(beer.id, rating, current_user.id)
    else
      data = service.find_beer_with_breweries(beer_id)["data"]
      new_beer = create_ratings(data)
      user_rating(new_beer.id, rating, current_user.id)
    end
  end

  def self.user_rating(beer_id, rating, user_id)
    UserRatedBeer.find_rated_beer(beer_id, rating, user_id)
  end

  def self.create_ratings(data)
    brewery = RatedBrewery.create_new(data["breweries"].first)
    create_rated_beer(data, brewery.id)
  end

  def self.create_rated_beer(data, brewery_id)
    RatedBeer.create(api_id: data["id"],
                     name: data["name"],
                     style_id: data["styleId"],
                     rated_brewery_id: brewery_id)
  end
end
