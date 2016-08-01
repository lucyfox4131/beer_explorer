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

  context "#all_styles" do
    it 'returns a list of all styles' do
      VCR.use_cassette("styles") do
        styles =BeerService.new.all_styles['data']
        style = styles.first

        expect(styles.count).to eq(170)
        expect(style["id"]).to eq(1)
        expect(style["name"]).to eq("Classic English-Style Pale Ale")
      end
    end
  end

  context "#find_brewery" do
    it 'returns a single brewery by id for show page' do
      VCR.use_cassette("brewery_by_id") do
        brewery = BeerService.new.find_brewery("YXDiJk")['data']

        expect(brewery["id"]).to eq("YXDiJk")
        expect(brewery["name"]).to eq("#FREEDOM Craft Brewery")
      end
    end

    it 'returns a single brewery by name' do
      VCR.use_cassette("brewery_by_name") do
        brewery = BeerService.new.brewery_by_name("New Belgium Brewing")['data'].first

        expect(brewery["id"]).to eq("Jt43j7")
        expect(brewery["name"]).to eq("New Belgium Brewing")
      end
    end
  end
end
