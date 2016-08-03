require 'rails_helper'

describe "Recommendation Generator" do
  context "#rec_by_style" do
    it "finds beers with same style id" do
      user = create(:user)
      beer = create(:rated_beer, style_id: "18")
      user_rated_beer = create(:user_rated_beer, user: user, rated_beer: beer)

      beers = RecommendationGenerator.rec_by_style(beer)

      expect(beers.count).to eq(3)
    end
  end

  context "#rec_by_brewery" do
    it "finds a beer based on brewery" do
      user = create(:user)
      brewery = create(:rated_brewery, name: "New Belgium Brewing", api_id: "Jt43j7")
      beer = create(:rated_beer, rated_brewery: brewery)
      user_rated_beer = create(:user_rated_beer, user: user, rated_beer: beer)

      beers = RecommendationGenerator.rec_by_brewery(beer)
      expect(beers.count).to eq(3)
    end
  end
end
