require "rails_helper"

RSpec.feature "User cannot see checkout until logged in" do
  scenario "if user goes to cart and is not logged in he sees login option" do
    # As a visitor when I have items in my cart
    # And when I visit "/cart"
    # I should not see an option to "Checkout"
    # I should see an option to "Login or Create Account to Checkout"
    # After I create an account
    # And I visit "/cart
    # Then I should see all of the data that was there when I was not logged in
    user = create(:user)
    item = create(:item)

    add_item_to_cart(item)

    visit "/cart"

    expect(page).to_not have_button("Checkout")

    expect(page).to have_content("Login")
    expect(page).to have_content("Create Account to Checkout")

    click_on "Create Account"

    expect(current_path).to eq new_user_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    select("Other", from: "user[gender]")
    click_on "Register"

    visit "/cart"

    expect(page).to have_content item.title
    expect(page).to have_content item.price
  end
end
