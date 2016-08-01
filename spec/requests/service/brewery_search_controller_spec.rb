require 'rails_helper'

describe "Brewery Search Controller" do
  it "can find a brewery by name" do

    get '/service/brewery_search', params: {"name" => "New Belgium Brewing"}

    found_brewery = json['data'].first

    expect(response).to be_success
    expect(found_brewery["name"]).to eq("New Belgium Brewing")
    expect(found_brewery["id"]).to eq("Jt43j7")
    expect(found_brewery["description"]).to include("Belgium")
  end
end
