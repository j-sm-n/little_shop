require "rails_helper"

RSpec.feature "User checks out" do
  scenario "fills cart, checks out and sees order" do
    user = create(:user)

    login_user(admin)

    visit '/items'

    click_on user.username

    save_and_open_page

  end
end
