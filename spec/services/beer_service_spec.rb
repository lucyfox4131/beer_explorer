require 'rails_helper'

describe "BeerService" do
  context "#beer_by_name" do
    it 'returns a beer by name' do
      VCR.use_cassette("beer_by_name") do
        name = "Cutthroat Porter"
        beer = BeerService.new.beer_by_name(name)

        beer_info = beer['data']

        expect(beer_info.count).to eq(1)
        expect(beer_info.first['name']).to eq(name)
        expect(beer_info.first['description']).to include("stout")
        expect(beer_info.first['abv']).to eq("5.1")
        expect(beer_info.first['ibu']).to eq("43")
      end
    end
  end
end
