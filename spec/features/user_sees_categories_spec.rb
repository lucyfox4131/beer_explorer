require 'rails_helper'

RSpec.feature "Categories" do
  scenario "user starts on root page and view categories of beer" do
    visit "/"

    click_on "Start Exploring"
    click_on "Styles"

    expect(current_path).to eq(styles_path)
    expect(page).to have_content("Styles of beers")
  end
end
