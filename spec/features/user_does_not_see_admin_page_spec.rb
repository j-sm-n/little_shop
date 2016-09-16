require "rails_helper"


RSpec.feature "User cannot see admin page" do
  scenario "if user is not register, he/she cannot see the admin page" do
    # As an unregistered user
    # When I visit "/admin/dashboard"
    # I get a 404

    user = create(:user)

    visit 'admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
