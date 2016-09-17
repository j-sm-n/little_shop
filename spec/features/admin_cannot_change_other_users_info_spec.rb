require "rails_helper"

RSpec.feature "" do
  scenario "" do
    # As a logged in Admin
    # I can modify my account data
    # But I cannot modify any other user's account data
    admin = create(:user, role: 1)

    visit '/login'

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "login-button"

    expect(current_path).to eq admin_dashboard_path







  end
end
