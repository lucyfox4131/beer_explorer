require 'rails_helper'

describe "Style" do
  it "can request beers for style by page number" do
    params = {"id" => 4,
              "name" => "Special Bitter or Best Bitter",
              "description" => "Nice and bitter",
              "ibuMin" => 30,
              "ibuMax" => 60,
              "abvMin" => 5,
              "abvMax" => 10}
    style = Style.new(params)
    beers_page2 = style.beers(2)

    expect(beers_page2.count).to eq(50)
    expect(beers_page2.first.name).to eq("DBA (Double Barrel Ale)")
  end
end
