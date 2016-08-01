require 'rails_helper'

describe "Recommendations" do
  context "#rec_by_style" do
    it "finds a beer based on style" do
      user = create(:user)
      beer = create(:rated_beer, style_id: "18")
      user_rated_beer = create(:user_rated_beer, user: user, rated_beer: beer)

      rec = Recommendations.new(user)
      new_beer = rec.rec_by_style(beer)

      expect(new_beer["styleId"]).to eq(18)
      expect(new_beer["name"]).to_not eq(beer.name)
    end
  end
  context "#rec_by_brewery" do
    it "finds a beer based on brewery" do
      user = create(:user)
      brewery = create(:rated_brewery, name: "New Belgium Brewing", api_id: "Jt43j7")
      beer = create(:rated_beer, rated_brewery: brewery)
      user_rated_beer = create(:user_rated_beer, user: user, rated_beer: beer)

      rec = Recommendations.new(user)
      new_beer = rec.rec_by_brewery(beer)
      breweries = new_beer["breweries"].map {|brewery| brewery["name"]}

      expect(new_beer["name"]).to_not eq(beer.name)
      expect(breweries).to include(brewery.name)
    end
  end
end
