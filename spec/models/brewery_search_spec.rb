require 'rails_helper'

describe "Brewery Search" do
  context "can find brewery by name" do
    scenario "Successfully finds brewery" do
      params = {"name" => "New Belgium Brewing"}

      brewery = BrewerySearch.find_by(params)['data'].first

      expect(brewery["name"]).to eq("New Belgium Brewing")
      expect(brewery["id"]).to eq("Jt43j7")
      expect(brewery["description"]).to include("Belgium")
    end
  end

  context "zip code" do
    scenario "returns locations by zipcode" do
      params = {"zip" => "80202"}
        locations = BrewerySearch.find_by(params)
        location = locations.first

        expect(location["name"]).to eq("Denver ChopHouse & Brewery")
        expect(locations.count).to eq(6)
    end
  end
end
