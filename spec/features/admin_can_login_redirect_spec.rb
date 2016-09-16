require "rails_helper"

RSpec.feature "Admin can login and be redirected to dashboard" do
  scenario "as admin I can login" do

    admin = create(:user, role: 1)

    expect(admin.role).to eq "admin"
  end
end
