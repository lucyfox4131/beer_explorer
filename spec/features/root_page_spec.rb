require 'rails_helper'

RSpec.feature "Root Page" do
  context "user visits root page" do
    scenario "sees all appropriate information" do
      visit "/"

      expect(page).to have_content("BeerExplorer")
      expect(page).to have_content("Start Exploring")
      expect(page).to have_content("Sign in with Google")

      expect(page).to have_content("Featured Brewery & Beer")
      expect(page).to have_content("ABV")
      expect(page).to have_content("IBU")
    end
  end
end
