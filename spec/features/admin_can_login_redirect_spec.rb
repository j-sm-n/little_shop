require "rails_helper"

RSpec.feature "Admin can login and be redirected to dashboard" do
  scenario "as admin I can login" do

    admin = create(:user, role: 1)

    expect(admin.role).to eq "admin"

    visit root_path

    expect(current_path).to eq "/"

    click_link "Login"

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "login-button"

    expect(current_path).to eq "/admin/dashboard"


  end
end
