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
    user = User.create(name: "Lucy Fox")
    beer1 = create(:rated_beer, name: "Beer One")
    beer2 = create(:rated_beer, name: "Beer Two")

    user_rated_beer1 = create(:user_rated_beer, rated_beer: beer1, user: user)
    user_rated_beer2 = create(:user_rated_beer, rated_beer: beer2, user: user)

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
  end
end
