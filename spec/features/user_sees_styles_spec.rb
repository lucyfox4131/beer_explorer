require 'rails_helper'

RSpec.feature "Styles" do
  scenario "user starts on root page and view styles of beer" do
    visit "/"

    click_on "Start Exploring"
    click_on "Styles"

    expect(current_path).to eq(styles_path)
    expect(page).to have_content("Styles of beers")

    expect(page).to have_content("Porter")
    expect(page).to have_content("IPA")
  end
end
