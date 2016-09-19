require "rails_helper"

RSpec.feature "User can see home page" do
  scenario "when user enter webpage address, he/she can see root page" do

    visit "/"

    expect(page).to have_content("HOME PAGE")
    expect(page).to have_content("Login")
    expect(page).to have_content("Shop")
    expect(page).to have_content("GoodGrocer")
  end
end
