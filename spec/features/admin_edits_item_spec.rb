require "rails_helper"

RSpec.feature "Admin edits item" do
  scenario "sees editted properties on the page" do
    # As an admin
    # When I visit "admin/items"
    # And I click "Edit"
    # Then my current path should be "/admin/items/:ITEM_ID/edit"
    # And I should be able to upate title, description, image, and status
    admin = create(:user, role: 1)
    login_user(admin)
    item = create(:item)

    visit '/admin/dashboard/items'
    expect(current_path).to eq admin_items_path

    click_on "Edit"

    fill_in "Long description", with: "This is a very long description"

    click_on "Update Item"

    expect(page).to have_content("This is a very long description")
  end
end
