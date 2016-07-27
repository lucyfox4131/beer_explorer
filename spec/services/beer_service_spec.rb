require 'rails_helper'

describe "BeerService" do
  context "#all_beers" do
    it 'returns a list of beers' do
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
