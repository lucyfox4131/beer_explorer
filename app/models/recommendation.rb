class Recommendation < ApplicationRecord
  has_many :user_recommendations
  has_many :users, through: :user_recommendations
end
