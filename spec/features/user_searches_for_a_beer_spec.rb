require 'rails_helper'

RSpec.feature "Beer Search" do
  context "user visits beer index" do
    scenario "searches for a beer by name" do
      visit beers_path
      #
      # expect(page).to have_content("Search for a beer by name")
      # within ".name-search" do
      #   fill_in "beer-name", with: "Cutthroat Porter"
      # end
      #
      # page.find("input#search-by-name").click
    end
  end
end
