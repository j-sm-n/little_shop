require 'rails_helper'

RSpec.feature "Admin Views Users Orders", type: :feature do
  # As an authenticated Admin, when I visit an individual order page
  # Then I can see the order's date and time.
  # And I can see the purchaser's full name and address.
  # And I can see, for each item on the order:
  # - The item's name, which is linked to the item page.
  # - Quantity in this order.
  # - Price
  # - Line item subtotal.
  # And I can see the total for the order.
  # And I can see the status for the order.
  scenario "admin can see order date and time" do
    pending
    create(:order_with_items)

    admin = create(:user, role: 1)
    login_user(admin)

    expect(page).to have_content("Sep 18, 2016 20:12:09 UTC")
  end

  scenario "admin can see purchaser's full name and address" do
    pending
    create(:order_with_items)

    admin = create(:user, role: 1)

    login_user(admin)

    expect(page).to have_content("Joe Delaware - 1378 Kemper Lane, Salt Lake City, Utah 84104")
  end

  scenario "admin can see each order item details" do
    pending
    create(:order_with_items)

    admin = create(:user, role: 1)

    login_user(admin)

    # within('ul.students li:first-child') do
    #     expect(page).to have_content student_2.name
    # end
  end
end
