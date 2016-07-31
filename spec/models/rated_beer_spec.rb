require 'rails_helper'

RSpec.describe RatedBeer, type: :model do
  context "relationships" do
    it { should have_many(:user_rated_beers) }
    it { should have_many(:users) }
    it { should belong_to(:rated_brewery) }
  end

  context ".create_rated_beer" do
    it "creates a new rated beer" do
      brewery = create(:rated_brewery)
      beer_data = {"id" => "1234", "name" => "BeerName", "styleId" => "14"}

      expect(RatedBeer.count).to eq(0)

      RatedBeer.create_rated_beer(beer_data, brewery.id)

      expect(RatedBeer.count).to eq(1)
      expect(RatedBeer.last.name).to eq("BeerName")
    end
  end

  context ".rate" do
    it "rates a new beer and updates existing beer ratings" do
      user = create(:user, name: "Lucy Fox")
      rating = 0
      beer_id = "XXgGZ4"

      RatedBeer.rate(beer_id, rating, user)
      user_rating = UserRatedBeer.find_by(user: user)

      expect(RatedBrewery.count).to eq(1)
      expect(RatedBeer.count).to eq(1)
      expect(RatedBeer.last.api_id).to eq("XXgGZ4")
      expect(user_rating.rating).to eq(0)

      new_rating = 1

      RatedBeer.rate(beer_id, new_rating, user)
      expect(RatedBeer.last.api_id).to eq("XXgGZ4")

      user_rating = UserRatedBeer.find_by(user: user)
      expect(user_rating.rating).to eq(1)
    end
  end
end
