class Recommendation < ApplicationRecord
  has_many :user_recommendations
  has_many :users, through: :user_recommendations

  def self.generate_recs(rating, beer_id, current_user)
    
  end
end
