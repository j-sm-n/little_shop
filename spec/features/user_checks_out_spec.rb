require "rails_helper"

RSpec.feature "User checks out" do
  scenario "fills cart, checks out and sees order" do
    # As a visitor
    # When I add items to my cart
    # And I visit "/cart"
    # And I click "Login or Register to Checkout"
    # Then I should be required to login
    # When I am logged in
    # And I visit my cart
    # And when I click "Checkout"
    # Then the order should be placed
    # And my current page should be "/orders"
    # And I should see a message "Order was successfully placed"
    # And I should see the order I just placed in a table
    item = create(:item)
    user = create(:user)

    add_item_to_cart(item)

    visit cart_path

    click_on "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_on "login-button"

    expect(current_path).to eq(cart_path)

    click_on "Checkout"

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_link("Order #1")
  end
end
