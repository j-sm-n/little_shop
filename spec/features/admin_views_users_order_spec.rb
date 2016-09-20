require 'rails_helper'

RSpec.feature "Admin Views Users Single Order", type: :feature do
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
    create(:order_with_items)

    admin = create(:user, role: 1)
    login_user(admin)
    click_link("#1")

    expect(page).to have_content(Time.now.strftime("%m/%d/%Y %I:%M%p"))
  end

  scenario "admin can see purchaser's full name and address" do
    order = create(:order_with_items)

    admin = create(:user, role: 1)

    login_user(admin)
    click_link("#1")

    expect(page).to have_content("Purchaser Name: Joe Delaware")
    expect(page).to have_content("Address: #{order.user.street_address}, Salt Lake City, Utah 84104")
  end

  scenario "admin can see each order item details" do
    order_items = create(:order_with_items)

    admin = create(:user, role: 1)

    login_user(admin)
    click_link("#1")

    within('ul.order-item-details h3:first-child') do
      expect(page).to have_link(order_items.items.first.title)
    end

    within('ul.order-item-details li:nth-child(2)') do
      expect(page).to have_content("Quantity: 1")
    end

    within('ul.order-item-details li:nth-child(3)') do
      expect(page).to have_content("Subtotal: $0.19")
    end
  end

  scenario "admin can see total price of order" do
    create(:order_with_items)

    admin = create(:user, role: 1)

    login_user(admin)
    click_link("#1")

    expect(page).to have_content("$0.57")
  end

  scenario "admin can see status of order" do
    create(:order_with_items, status: "Paid")

    admin = create(:user, role: 1)

    login_user(admin)
    click_link("#1")

    expect(page).to have_content("Paid")
  end
end
