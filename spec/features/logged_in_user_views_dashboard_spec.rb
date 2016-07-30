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
end
