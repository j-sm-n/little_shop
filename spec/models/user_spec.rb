require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with sufficient attributes' do
    it "has the right attributes" do
      user = create(:user)

      expect(user).to be_valid
      expect(user.username).to include('Joe')
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
  end
end
