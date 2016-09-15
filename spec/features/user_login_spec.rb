require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  scenario "when visitor goes to login page" do
    # As a visitor
    # When I visit "/"
    # Then I should see a link for "Login"
    # And when I click "Login"
    # And I should be on the "/login" page
    # I should see a place to insert my credentials to login
    # And I should see a link to "Create Account"
    # And I fill in my desired credentials
    # And I submit my information
    # Then my current page should be "/dashboard"
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    # And I should see my profile information
    # And I should not see a link for "Login"
    # And I should see a link for "Logout"
    User.create(username: "jeffjeff",
                password: "12345",
                password_confirmation: "12345",
                gender: "Male")

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_link("Create Account")

    fill_in "Username", with: "jeffjeff"
    fill_in "Password", with: "12345"
    # save_and_open_page
    # first(:link, 'Login').click
    click_on "login-button"

    expect(current_path).to eq(dashboard_path)

    within(:css, "navbar") do
      expect(page).to have_content "Logged in as jeffjeff"
    end

    expect(page).to have_content "Male"
    expect(page).to have_no_link("Login")
    expect(page).to have_link("Logout")
  end
end
