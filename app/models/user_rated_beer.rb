class UserRatedBeer < ApplicationRecord
  belongs_to :user
  belongs_to :rated_beer
end
