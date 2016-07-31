require 'rails_helper'

RSpec.feature "User Logs in" do
  scenario "User can successfully login and out with google" do
    visit root_path

    expect(page).to have_link("Sign in with Google")

    mock_omniauth

    click_link "Sign in with Google"

    expect(page).to have_content("Signed in as Lucy Fox")
    expect(page).to have_link("Sign Out")

    click_link "Sign Out"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Signed in as Lucy Fox")
  end
end
