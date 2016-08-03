class UserRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation
end
