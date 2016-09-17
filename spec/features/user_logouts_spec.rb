require 'rails_helper'

RSpec.feature "UserLogouts", type: :feature do
  scenario "user can logout" do
    # As a logged in user
    # When I click "Logout"
    # Then I should see see "Login"
    # And I should not see "Logout"
    create_user
    user_login
    click_on("Logout")

    expect(page).to have_content("You have logged out")
    expect(page).to have_no_link("Logout")
  end

  def create_user
    User.create(username: "jeffjeff",
                password: "12345",
                password_confirmation: "12345",
                gender: "Male")
  end

  def user_login
    visit login_path
    fill_in "Username", with: "jeffjeff"
    fill_in "Password", with: "12345"
    click_on "login-button"
  end
end
