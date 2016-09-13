require 'rails_helper'

RSpec.feature "User sees all the items" do
  scenario "User visits items page" do
    # Given items exist
    # As a User
    # when I visit the items page
    # Then I expect to see all the items
    Item.create(name: "Yak", quantity: "200", price: "150")

    visit items_index

  expect(page).to have_content "Yak"
  end
end
