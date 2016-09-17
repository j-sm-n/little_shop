require "rails_helper"

RSpec.feature "User sees past orders" do
  # Given an authenticated user with a past order
  # As an Authenticated User
  # When I visit "/orders"
  # Then I should see all orders belonging to me and no other orders
  scenario "visit orders page with one order" do
    user = create(:user)

    order = user.orders.create(status: "pending")
    order.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")

    visit root_path
    click_link "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "login-button"
    # byebug
    visit "/orders"

    expect(page).to have_content("#{user.username}'s Past Orders")
    expect(page).to have_content("Order #1")
    expect(page).to have_content("Banana")
    expect(page).to have_content("Apple")
  end

  scenario "visit orders page with one order" do
    # Given an authenticated user with a past order
    # As an Authenticated User
    # When I visit "/orders"
    # Then I should see all orders belonging to me and no other orders
    user = create(:user)
    user_2 = User.create(username: "jeffjeff",
                         password: "12345",
                         password_confirmation: "12345",
                         gender: "Male")

    order_1 = user.orders.create(status: "pending")
    order_1.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order_1.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")

    order_2 = user_2.orders.create(status: "pending")
    order_2.items.create(title: "Tea", description: "Boiled Tea-Leaf Water", price: 50, image_path: "placeholder")
    order_2.items.create(title: "Soap", description: "Bar of Cleaning", price: 120, image_path: "placeholder")

    visit root_path
    click_link "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "login-button"

    visit "/orders"

    expect(page).to have_content("#{user.username}'s Past Orders")
    expect(page).to have_content("Order #1")
    expect(page).to have_content("Banana")
    expect(page).to have_content("Apple")

    expect(page).to_not have_content("Tea")
    expect(page).to_not have_content("Soap")
  end
end
