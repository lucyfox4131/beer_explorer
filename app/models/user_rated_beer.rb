class UserRatedBeer < ApplicationRecord
  belongs_to :user
  belongs_to :rated_beer

  def self.find_rated_beer(beer_id, new_rating, user_id)
    where(rated_beer_id: beer_id, user_id: user_id).first_or_initialize.tap do |user_rated_beer|
      user_rated_beer.rated_beer_id = beer_id
      user_rated_beer.rating = new_rating
      user_rated_beer.user_id = user_id
      user_rated_beer.save!
    end
  end
end
