require "rails_helper"

RSpec.feature "User/Admin edit profile and are directed to different pages" do
  scenario "User edit their profile" do
    user = create(:user)

    login_user(user)

    expect(current_path).to eq '/dashboard'

    visit '/items'

    click_on user.username

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.street_address)

    click_on "Edit Profile"

    expect(page).to have_content("#{user.username}'s Profile Page")

    fill_in "First name", with: "Scooby"
    fill_in "Last name", with: "Doo"
    fill_in "Street address", with: "300 North 3rd Street"

    click_on "Update Information"

    expect(current_path).to eq "/dashboard"
    expect(page).to have_content("Scooby")
    expect(page).to have_content("Doo")
    expect(page).to have_content("300 North 3rd Street")
  end

  scenario "User edit their profile" do
    admin = create(:user, role: 1)

    login_user(admin)

    expect(current_path).to eq '/admin/dashboard'

    visit '/items'

    click_on admin.username

    expect(page).to have_content(admin.username)

    click_on "Update Profile"

    expect(page).to have_content("#{admin.username}'s Profile Page")

    fill_in "First name", with: "Magilla"
    fill_in "Last name", with: "Gorilla"
    fill_in "Street address", with: "Cartoon Network street"

    click_on "Update Information"

    expect(current_path).to eq "/dashboard"
    expect(page).to have_content("Magilla")
    expect(page).to have_content("Gorilla")
    expect(page).to have_content("Cartoon Network street")
  end
end
