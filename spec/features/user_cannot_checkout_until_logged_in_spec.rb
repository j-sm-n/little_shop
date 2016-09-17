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

    visit '/cart'

    save_and_open_page

    expect(page).to have_content("Login")
    expect(page).to have_content("Create Account to Checkout")



  end
end
