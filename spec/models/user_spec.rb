require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with sufficient attributes' do
    it "has the right attributes" do
      user = create(:user)

      expect(user).to be_valid
      expect(user.username).to eq('Joe')
      expect(user.password).to eq('123foo456')
      expect(user.password_confirmation).to eq('123foo456')
      expect(user.gender).to eq('Other')
    end

    it "does not save user with with already taken username" do
      create(:user)
      user = User.new(username: "Joe",
                      password: "12345",
                      password_confirmation: "12345",
                      gender: "Other")

      expect(user).to be_invalid
    end
  end
end
