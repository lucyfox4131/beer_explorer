require 'rails_helper'

RSpec.feature "User rates a beer" do
  scenario "visits show page to rate beer" do
    user = create(:user, name: "Lucy")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit beer_path("XXgGZ4")

    expect(page).to have_content("Cutthroat Porter")
    expect(page).to have_content("Rate Cutthroat Porter")

    within(".rate-beer") do
      expect(page).to have_button("Like")
      expect(page).to have_button("Dislike")
      click_button "Like"
    end

    expect(page).to have_content("You've rated Cutthroat Porter")
    expect(current_path).to eq(beer_path("XXgGZ4"))
  end
end
