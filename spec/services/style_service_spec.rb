require 'rails_helper'

describe "Style Service" do
  it "returns beers with page number specified" do
    #Special Bitter or Best Bitter
    id = 4
    beers = StyleService.new.find_beers_for_style(4, 2)

    expect(beers["numberOfPages"]).to eq(3)

    expect(beers['data'].count).to eq(50)
    expect(beers["data"].first["name"]).to eq("DBA (Double Barrel Ale)")
  end
end
