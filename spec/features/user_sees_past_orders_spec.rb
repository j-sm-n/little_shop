require "rails_helper"

RSpec.feature "User sees past orders" do
  scenario "visit orders page with one order" do
    # Given an authenticated user with a past order
    # As an Authenticated User
    # When I visit "/orders"
    # Then I should see all orders belonging to me and no other orders
    user = User.create(username: "foo", password: "123", password: "123", gender: "Other")

    order = user.orders.create(status: "pending")
    order.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")

    visit "/orders"

    expect(page).to have_content("Past Orders")
    expect(page).to have_link("Order 1")
  end
end
