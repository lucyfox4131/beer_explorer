require 'rails_helper'

describe "Beer Search Controller" do
  it "can find a beer by name" do

    get '/service/beer_search', params: {"name" => "Cutthroat Porter"}

    found_beer = json['data'].first
    
    expect(response).to be_success
    expect(found_beer["name"]).to eq("Cutthroat Porter")
    expect(found_beer["id"]).to eq("XXgGZ4")
    expect(found_beer["description"]).to include("Colorado")
  end
end
