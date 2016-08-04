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

  context "rated beers" do
    it "returns only liked beers (rating of 1)" do
      user = create(:user)
      beer1 = create(:rated_beer, name: "Liked Beer")
      user_rated_beer1 = create(:user_rated_beer, rated_beer: beer1, user: user, rating: 1)

      beer2 = create(:rated_beer, name: "Disliked Beer")
      user_rated_beer2 = create(:user_rated_beer, rated_beer: beer2, user: user, rating: 0)

      liked_beers = user.liked_beers

      expect(liked_beers.count).to eq(1)
      expect(liked_beers.first.name).to eq("Liked Beer")
    end

    it "returns only beers with 'dislike' rating of 0" do
      user = create(:user)
      beer1 = create(:rated_beer, name: "Liked Beer")
      user_rated_beer1 = create(:user_rated_beer, rated_beer: beer1, user: user, rating: 1)

      beer2 = create(:rated_beer, name: "Disliked Beer")
      user_rated_beer2 = create(:user_rated_beer, rated_beer: beer2, user: user, rating: 0)

      disliked_beers = user.disliked_beers

      expect(disliked_beers.count).to eq(1)
      expect(disliked_beers.first.name).to eq("Disliked Beer")
    end
  end
end
