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
      beer = create(:rated_beer, api_id: "XXgGZ4")

      expect(Recommendation.count).to eq(0)
      expect(UserRecommendation.count).to eq(0)

      RecommendationGenerator.generate(rating, beer.api_id, user.id)

      expect(Recommendation.count).to eq(0)
      expect(UserRecommendation.count).to eq(0)
    end

    it "will generate if user rates positively" do
      rating = "1"
      user = create(:user, name: "Lucy")
      brewery = create(:rated_brewery, api_id: "Jt43j7")
      beer = create(:rated_beer, api_id: "XXgGZ4", rated_brewery: brewery)

      expect(Recommendation.count).to eq(0)

      results = RecommendationGenerator.generate(rating, beer.api_id, user.id)

      expect(Recommendation.count).to be > 0
    end
  end
end
