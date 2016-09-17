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

    click_link "Update Profile"

    expect(current_path).to eq admin_edit_dashboard_path
    expect(page).to have_content("#{admin.username}'s Profile Page")

    select("Female", from: "user[gender]")

    click_on "Update Information"

    expect(page).to have_content("Female")
    expect(current_path).to eq dashboard_path
  end
end
