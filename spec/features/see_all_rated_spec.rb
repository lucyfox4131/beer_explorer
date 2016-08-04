require 'rails_helper'

RSpec.feature "All Rated" do
  context "user views all rated page" do
    scenario "can see all liked and disliked beers" do
      user_ratings1, user_ratings2 = create_list(:user_rated_beer, 2, rating: 1)
      user_ratings3 = create(:user_rated_beer, rating: 0)

      visit ratings_path
      expect(page).to have_content("All Rated Beers")
      expect(page).to have_content("All Liked Beers")

      within(".liked") do
        expect(page).to have_content(user_ratings1.rated_beer.name)
        expect(page).to have_content(user_ratings2.rated_beer.name)
      end

      expect(page).to have_content("All Disliked Beers")

      within(".disliked") do
        expect(page).to have_content(user_ratings3.rated_beer.name)
      end
    end
  end
end
