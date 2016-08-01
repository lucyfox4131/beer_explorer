require 'rails_helper'

RSpec.feature "Brewery Show" do
  scenario "user views brewery show page" do
    visit brewery_path("Jt43j7")

    expect(page).to have_content("New Belgium Brewing")
    expect(page).to have_content("New Belgium Brewing Beers")
    expect(page).to have_content("1554")
  end
end
