require "rails_helper"

RSpec.feature "Admin edits item" do
  scenario "sees editted properties on the page" do
    # As an admin
    # When I visit "admin/items"
    # And I click "Edit"
    # Then my current path should be "/admin/items/:ITEM_ID/edit"
    # And I should be able to upate title, description, image, and status
    admin = create(:user, role: 1)
    item = create(:item)

    visit admin_items_path

    click_on "Edit"

    fill_in "Title", with: "Psuedo-Bacon"
    click_on "Update item"

    expect(page).to have_content("Psuedo-Bacon")
  end
end
