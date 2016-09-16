require "rails_helper"

RSpec.feature "User can delete item from cart" do
  scenario "user removes item from cart" do
    # Given an item exists
    # And has been added to the cart
    # As a visitor
    # When I visit "/cart"
    # And I click link "Remove"
    # Then my current page should be "/cart"
    # And I should see a message styled in green
    # And the message should say "Successfully removed SOME_ITEM from your cart."
    # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    # And I should not see the item listed in cart
    item = create(:item)

    visit items_path

    click_on "Add to Cart"

    click_on "cart_link"

    expect(page).to have_content item.title

    click_on "Remove"

    expect(current_path).to eq(cart_path)

    expect(page).to have_content("Successfully removed #{item.title} from your cart.")
    expect(page).to have_link(item.title, href: item_path(item))

    within("#yield-container") do
      expect(page).not_to have_content(item.title)
    end
  end
end
