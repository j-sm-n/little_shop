require 'rails_helper'

RSpec.feature "Unathenticated User Security", type: :feature do
  # As an Unauthenticated User
  # I cannot view another user's private data, such as current order, etc.
  # I should be redirected to login/create account when I try to check out.
  # I cannot view the administrator screens or use administrator functionality.
  # I cannot make myself an administrator.
end
