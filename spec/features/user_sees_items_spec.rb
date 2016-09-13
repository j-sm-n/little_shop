require 'rails_helper'

RSpec.feature "User sees all the items" do
  context "when items already exist" do
    scenario "User visits items page with one item" do
      # Given an item exists
      # As a User
      # when I visit the items page
      # Then I expect to see the item
      Item.create(name: "Yak", quantity: "200", price: "150")

      visit items_path

      expect(page).to have_content "Yak"
    end

    scenario "User visits items page with many items" do
      # Given items exist
      # As a User
      # when I visit the items page
      # Then I expect to see all the items
      Item.create(name: "Yak", quantity: "200", price: "150")
      Item.create(name: "Silk Yarn", quantity: "50", price: "23")
      Item.create(name: "Yo-Yo", quantity: "2000", price: "5")

      visit items_path

      expect(page).to have_content "Yak"
      expect(page).to have_content "Silk Yarn"
      expect(page).to have_content "Yo-Yo"
    end
  end
end
