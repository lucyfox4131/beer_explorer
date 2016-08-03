require 'rails_helper'

RSpec.feature "Beer Show" do
  scenario "user successfully views a single beer" do
    visit style_path(7)

    expect(page).to have_content("Scottish-Style Light Ale")
    expect(page).to have_content("Beers with this Style")

    expect(page).to have_link("Kilted Gnome Scottish Ale")

    click_link("Kilted Gnome Scottish Ale")

    expect(page).to have_content("Kilted Gnome Scottish Ale")
  end
end
