require 'rails_helper'

RSpec.describe RatedBrewery, type: :model do
  context "relationships" do
    it { should have_many(:rated_beers) }
  end

  context ".create_new" do
    it "creates a new rated brewery" do
      brewery = {"id" => "1234",
                  "name" => "BreweryName",
                  "images" => {"icon" => "https://s3.amazonaws.com/brewerydbapi/beer/XXgGZ4/upload_2Mh3c3-icon.png"},
                  "locations" => [{"postalCode" => "80202"}]}

      expect(RatedBrewery.count).to eq(0)

      RatedBrewery.create_new(brewery)
      expect(RatedBrewery.count).to eq(1)
      expect(RatedBrewery.last.name).to eq("BreweryName")
    end
  end
end
