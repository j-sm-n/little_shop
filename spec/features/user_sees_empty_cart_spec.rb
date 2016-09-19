require 'rails_helper'

RSpec.feature "User Sees Empty Cart", type: :feature do
  scenario "when cart has no items" do
    visit root_path
    click_on "cart_link"

    expect(current_path).to eq("/cart")

    expect(page).to have_content("Your cart is empty.")
    expect(page).to have_link("Start shopping!")
  end
end
