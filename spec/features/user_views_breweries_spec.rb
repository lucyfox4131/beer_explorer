require 'rails_helper'

RSpec.feature "Viewing Breweries" do
  scenario "user views all breweries and can view one at a time" do
    visit breweries_path

    expect(page).to have_content("All Breweries")
    expect(page).to have_content("#FREEDOM Craft Brewery")
    expect(page).to have_link("#FREEDOM Craft Brewery")

    click_link "#FREEDOM Craft Brewery"

    expect(current_path).to eq(brewery_path("YXDiJk"))
    expect(page).to have_content "#FREEDOM Craft Brewery"
    expect(page).to have_content "#FREEDOM Craft Brewery Beers"
  end
end
