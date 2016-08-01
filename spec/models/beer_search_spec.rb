require 'rails_helper'

describe "Beer Search" do
  context "can find beer by name" do
    scenario "Successfully finds beer" do
      params = {"name" => "Cutthroat Porter"}

      beer = BeerSearch.find_beer(params)['data'].first

      expect(beer["name"]).to eq("Cutthroat Porter")
      expect(beer["id"]).to eq("XXgGZ4")
      expect(beer["description"]).to include("Colorado")
    end
  end
end
