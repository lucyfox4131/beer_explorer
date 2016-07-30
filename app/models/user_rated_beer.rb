class UserRatedBeer < ApplicationRecord
  belongs_to :rated_beer
  belong_to :user
end
