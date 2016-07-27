require 'rails_helper'

RSpec.feature "User Logs in" do
  scenario "User can successfully login with google" do
    # VCR.use_cassette("user_login") do
      visit root_path

      expect(page).to have_link("Sign in with Google")

      mock_omniauth

      click_link "Sign in with Google"

      expect(page).to have_content("Hello, Lucy Fox")
      expect(page).to have_link("Logout")
    # end
  end
end
