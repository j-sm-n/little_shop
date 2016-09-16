require "rails_helper"

RSpec.feature "User cannot see admin page" do
  scenario "if user is not registered, he/she cannot see the admin page" do
    # As an unregistered user
    # When I visit "/admin/dashboard"
    # I get a 404

    visit 'admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "if user is registered and logged in, he/she cannot see the admin page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit 'admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
