require 'rails_helper'

RSpec.feature "Logged in User" do
  scenario "views their dashboard" do
    user = User.create(name: "Lucy Fox")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_path

    expect(page).to have_link("Signed in as Lucy Fox")
    expect(page).to have_link("Sign Out")

    expect(page).to have_content("Welcome, Lucy Fox")
    expect(page).to have_content("Sorry, you do not have any rated beers. Go rate some beers!")
    expect(page).to have_content("Please rate beers in order to get recommendations")
  end

  scenario "a user not logged in will be redirected" do
    visit dashboard_path

    expect(page).to have_content("Please Sign In To See Your Dashbaord")
    expect(current_path).to eq(root_path)
  end

  scenario "logged in user sees their rated beers" do
    user = create(:user, name: "Lucy Fox")
    brewery = create(:rated_brewery, name: "New Belgium Brewing", api_id: "Jt43j7")

    beer1 = create(:rated_beer, name: "Beer One", style_id: "18", rated_brewery: brewery)
    beer2 = create(:rated_beer, name: "Beer Two", style_id: "16", rated_brewery: brewery)

    user_rated_beer1 = create(:user_rated_beer, rated_beer: beer1, user: user)
    user_rated_beer2 = create(:user_rated_beer, rated_beer: beer2, user: user)

    recommendation1, recommendation2 = create_list(:recommendation, 2)

    user_recommendations1 = create(:user_recommendation, recommendation: recommendation1, user: user)
    user_recommendations2 = create(:user_recommendation, recommendation: recommendation2, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_path

    expect(page).to have_link("Signed in as Lucy Fox")
    expect(page).to have_link("Sign Out")

    expect(page).to have_content("Welcome, Lucy Fox")
    expect(page).to_not have_content("Sorry, you do not have any rated beers. Go rate some beers!")

    within(".beers") do
      expect(page).to have_link("Beer One")
      expect(page).to have_link("Beer Two")
    end

    expect(page).to have_content("Beer Recommendations For You")

  end
end
