require 'rails_helper'

RSpec.feature "Viewing Breweries" do
  scenario "user searches for a brewery by name" do
    visit breweries_path

    expect(page).to have_content("Search for a brewery by name")

    within ".brew-name-search" do
      fill_in "brewery-name", with: "New Belgium Brewing"
    end

    page.find("input#brew-search-by-name").click

  end
end
