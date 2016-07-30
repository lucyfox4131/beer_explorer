require 'rails_helper'

RSpec.describe UserRatedBeer, type: :model do
  context "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:rated_beer) }
  end

  context ".find_rated_beer" do
    it "already exists, update rating" do
      user = create(:user, name: "Lucy")
      rated_beer = create(:rated_beer, name: "Cutthroat Porter")
      user_rated_beer = create(:user_rated_beer, rating: 0, user: user, rated_beer: rated_beer)

      expect(user_rated_beer.rating).to eq(0)

      new_rating = 1
      record = UserRatedBeer.find_rated_beer(rated_beer.id, new_rating, user.id)

      expect(record.rating).to eq(new_rating)
    end

    it "doesn't exist, create new" do
      user = create(:user, name: "Lucy")
      rated_beer = create(:rated_beer, name: "Cutthroat Porter")
      rating = 1

      record = UserRatedBeer.find_rated_beer(rated_beer.id, rating, user.id)

      expect(record.rating).to eq(rating)
      expect(record.user_id).to eq(user.id)
      expect(record.rated_beer_id).to eq(rated_beer.id)
    end
  end
end
