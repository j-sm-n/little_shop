require 'rails_helper'

RSpec.feature "User Authenticates", type: :feature do
  scenario "user cannot view other users' current or past orders" do
    # I cannot view another user's private data (current or past orders, etc)
    user_1 = create(:user)
    user_2 = create(:user)
    login_user(user_1)

    order = user_2.orders.create(status: "pending")
    order.items.create(title: "Banana", description: "Wholesome Yellow Goodness", price: 19, image_path: "placeholder")
    order.items.create(title: "Apple", description: "Wholesome Red Goodness", price: 21, image_path: "placeholder")

    visit order_path(order)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario " " do
    # I cannot view the administrator screens or use admin functionality
  end

  scenario " " do
    # I cannot make myself an admin
  end

  def login_user(user)
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "login-button"
  end
end
