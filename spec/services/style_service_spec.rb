require 'rails_helper'

describe "Style Service" do
  context "#find_beers_for_style" do
    it "returns beers with page number specified" do
      #Special Bitter or Best Bitter
      VCR.use_cassette("beers_for_style") do
        id = 4
        beers = StyleService.new.find_beers_for_style(4, 2)

        expect(beers["numberOfPages"]).to eq(3)

        expect(beers['data'].count).to eq(50)
        expect(beers["data"].first["name"]).to eq("DBA (Double Barrel Ale)")
      end
    end
  end

  context "#all_styles" do
    it 'returns a list of all styles' do
      VCR.use_cassette("styles") do
        styles = StyleService.new.all_styles['data']
        style = styles.first

        expect(styles.count).to eq(170)
        expect(style["id"]).to eq(1)
        expect(style["name"]).to eq("Classic English-Style Pale Ale")
      end
    end
  end

  context "#find_style" do
    it "returns a single style by id" do
      VCR.use_cassette("single_style") do

        style_id = 1
        style = StyleService.new.find_style(1)["data"]

        expect(style["name"]).to eq("Classic English-Style Pale Ale")
        expect(style["id"]).to eq(1)
      end
    end
  end
end
