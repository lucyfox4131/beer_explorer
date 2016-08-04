require 'rails_helper'

describe "Brewery Service" do
  context "#find_brewery" do
    it 'returns a single brewery by id for show page' do
      VCR.use_cassette("brewery_by_id") do
        brewery = BreweryService.new.find_brewery("YXDiJk")['data']

        expect(brewery["id"]).to eq("YXDiJk")
        expect(brewery["name"]).to eq("#FREEDOM Craft Brewery")
      end
    end
  end

  context "#beers_for_brewery" do
    it 'returns beers for a brewery' do
      VCR.use_cassette("beers_for_brewery") do
        beers = BreweryService.new.beers_for_brewery("YXDiJk")['data']

        expect(beers.first["name"]).to eq("A Toast")
        expect(beers.first["id"]).to eq("iZZRvV")
      end
    end
  end

  context "#brewery_by_name" do
    it 'returns a single brewery by name' do
      VCR.use_cassette("brewery_by_name") do
        brewery = BreweryService.new.brewery_by_name("New Belgium Brewing")['data'].first

        expect(brewery["id"]).to eq("Jt43j7")
        expect(brewery["name"]).to eq("New Belgium Brewing")
      end
    end
  end

  context "#brewery_by_zip" do
    it "returns locations by zipcode" do
      VCR.use_cassette("locations") do

        locations = BreweryService.new.brewery_by_zip(80202)["data"]
        location = locations.first

        expect(location["name"]).to eq("Denver ChopHouse & Brewery")
        expect(locations.count).to eq(6)
      end
    end
  end
end
