require 'rails_helper'

RSpec.feature "Unathenticated User Security", type: :feature do
  # As an Unauthenticated User (aka Visitor)
  # I cannot view another user's private data, such as current order, etc.
  # I should be redirected to login/create account when I try to check out.
  # I cannot view the administrator screens or use administrator functionality.
  # I cannot make myself an administrator.
  scenario "unathenticated user cannot view another user's private data" do
    visit dashboard_path

    expect(current_path).to eq(login_path)
    expect(page).to have_link("Create Account")
  end

  scenario "unathenticated user cannot checkout" do
    visit cart_path
    click_on "Checkout"

    expect(current_path).to eq(login_path)
  end

  scenario "unathenticated user cannot view admin dashboard" do
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
