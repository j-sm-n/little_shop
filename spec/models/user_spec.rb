require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the right attributes" do
    user = create(:user)

    expect(user).to be_valid
    expect(user.username).to include('Joe')
    expect(user.first_name).to eq('Joe')
    expect(user.last_name).to eq('Delaware')
    expect(user.street_address).to include('Kemper Lane')
    expect(user.city).to eq('Salt Lake City')
    expect(user.state).to eq('Utah')
    expect(user.zip_code).to eq('84104')
    expect(user.password).to eq('123foo456')
    expect(user.password_confirmation).to eq('123foo456')
    expect(user.gender).to eq('Other')
  end

  it "does not save user with with already taken username" do
    user_1 = create(:user)
    user_2 = User.new(username: user_1.username,
                      password: "123456",
                      password_confirmation: "123456",
                      gender: "Other")

    expect(user_2).to be_invalid
  end

  context "user roles" do
    it "has default role by default" do
      user = create(:user)

      expect(user.role).to eq("default")
    end

    it "can have admin role" do
      user = create(:user, role: 1)

      expect(user.role).to eq("admin")
    end
  end

    it { should have_many :orders }
end
