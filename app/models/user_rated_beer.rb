class UserRatedBeer < ApplicationRecord
  belongs_to :user
  belongs_to :rated_beer

  def self.find_rated_beer(beer_id, rating, user_id)
    where(rated_beer_id: beer_id, user_id: user_id).first_or_create do |new_beer|
      new_beer.rated_beer_id = beer_id
      new_beer.rating = rating
      new_beer.user_id = user_id
    end
  end
end
