require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  context "relationships" do
    it { should have_many(:user_recommendations) }
    it { should have_many(:users) }
  end

  context "generating new user recommendations" do
    it "wont generate a rating if beer is disliked" do
      rating = 0
      user = create(:user, name: "Lucy")
      beer_id = "XXgGZ4"

      expect(Recommendation.count).to eq(0)
      expect(UserRecommendation.count).to eq(0)

      Recommendation.generate_recs(rating, beer_id, user)

      expect(Recommendation.count).to eq(0)
      expect(UserRecommendation.count).to eq(0)
    end
  end
end
