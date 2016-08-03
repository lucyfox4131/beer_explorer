require 'rails_helper'

RSpec.describe User, type: :model do
  context "relationships" do
    it { should have_many(:user_rated_beers) }
    it { should have_many(:rated_beers) }
    it { should have_many(:user_recommendations)}
    it { should have_many(:recommendations)}
  end

  context "#rated beers" do
    it "returns list of users rated beers" do
      user = create(:user)

      beer1 = create(:rated_beer, name: "Beer One")
      beer2 = create(:rated_beer, name: "Beer Two")

      user_rated_beer1 = create(:user_rated_beer, rated_beer: beer1, user: user)
      user_rated_beer2 = create(:user_rated_beer, rated_beer: beer2, user: user)

      expect(user.user_rated_beers.count).to eq(2)
      expect(user.rated_beers.count).to eq(2)
    end
  end
end
