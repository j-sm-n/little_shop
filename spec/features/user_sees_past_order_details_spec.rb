require "rails_helper"

RSpec.feature "User sees past order" do
  scenario "details on order page for completed order" do
    # Given a user with orders
    # As an authenticated user
    # When I visit "/orders"
    # Then I should see my past order
    # And I should see a link to view that order
    # And when I click that link
    # Then I should see each item that was order with the quantity and line-item subtotals
    # And I should see links to each item's show page
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
    order = create(:order)
    order.update_attribute(:status, "completed")
    user = order.user

    item = order.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")
    order.ordered_items.create(item_id: item.id)

    visit root_path
    click_link "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "login-button"

    visit "/orders"

    expect(page).to have_link("Order #1")

    click_link("Order #1")

    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Subtotal: $0.38")
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Subtotal: $0.21")

    expect(page).to have_link("Banana")
    expect(page).to have_link("Apple")

    expect(page).to have_content("Status: completed")

    expect(page).to have_content("Total: $0.59")

    expect(page).to have_content(Time.now.strftime("%m/%d/%Y %I:%M%p"))
  end

  scenario "details on order page" do
    # Given a user with orders
    # As an authenticated user
    # When I visit "/orders"
    # Then I should see my past order
    # And I should see a link to view that order
    # And when I click that link
    # Then I should see each item that was order with the quantity and line-item subtotals
    # And I should see links to each item's show page
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
    order = create(:order)
    user = order.user

    item = order.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")
    order.ordered_items.create(item_id: item.id)

    visit root_path
    click_link "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "login-button"

    visit "/orders"
    expect(page).to have_link("Order #1")

    click_link("Order #1")

    expect(page).to_not have_content(order.updated_at)
  end
end
