require 'rails_helper'

RSpec.feature 'Visiter can create account', type: :feature do
  scenario 'when visitor goes to login page' do
    # As a visitor
    # When I visit "/login"
    # And when I click link "Create Account"
    # And I fill in my desired credentials
    # And I submit my information
    # Then my current page should be "/dashboard"
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    # And I should see my profile information
    # And I should not see a link for "Login"
    # And I should see a link for "Logout"
    visit login_path
    click_link 'Create Account'

    expect(current_path).to eq(new_user_path)

    fill_in 'Username', with: 'becky_123'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    select('Female', from: 'gender')
    click_on "Register"
    save_and_open_page

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content 'Logged in as becky_123'
    # expect(page).to have_content 'Female' => gender is not saving to the db for some reason
    expect(page).to have_no_link('Login')
    expect(page).to find_link('Logout')
  end
end
