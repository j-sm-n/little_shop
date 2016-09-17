require "rails_helper"

RSpec.feature "Retired item" do
  scenario "'item retired' rather than checkout appears on item page" do
    # As a user if I visit an item page and that item has been retired
    # Then I should still be able to access the item page
    # And I should not be able to add the item to their cart
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
    item = create(:item, retired: true)

    visit item_path(item)

    expect(page).to_not have_button("Add to Cart")
    expect(page).to have_content("Item Retired")
  end
end
