require 'rails_helper'

RSpec.feature "Admin changing order statuses", type: :feature do
  # Given orders exist
  # As an Admin
  # When I visit the dashboard
  # Then I can see a listing of all orders
  # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "completed")
  # And I can see a link for each individual order
  # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
  # And I have links to transition between statuses
  # - I can click on "cancel" on individual orders which are "paid" or "ordered"
  # - I can click on "mark as paid" on orders that are "ordered"
  # - I can click on "mark as completed" on orders that are "paid"
  scenario "sees all orders with statuses on dashboard" do
    create(:order_with_items, status: "Paid")

    order_completed = create(:order_with_items)
    order_completed.update_attribute(:status, "Completed")

    admin = create(:user, role: 1)
    login_user(admin)

    expect(page).to have_link("#1")
    expect(page).to have_link("#2")
    expect(page).to_not have_link("#3")

    expect(page).to have_content("Paid")
    expect(page).to have_content("Completed")
  end

  scenario "filter orders by status" do
    order_paid_1 = create(:order_with_items, status: "Paid")
    order_paid_2 = create(:order_with_items, status: "Paid")

    order_completed = create(:order_with_items)
    order_completed.update_attribute(:status, "Completed")

    admin = create(:user, role: 1)
    login_user(admin)

    click_on "Paid Orders"

    expect(page).to have_link("##{order_paid_1.id}", href: order_path(order_paid_1))
    expect(page).to have_link("##{order_paid_2.id}", href: order_path(order_paid_2))

    visit admin_dashboard_path

    click_on "Completed Orders"

    expect(page).to have_link("##{order_completed.id}", href: order_path(order_completed))
  end

  scenario "cancel 'paid' order" do
    order_paid = create(:order_with_items)
    order_paid.update_attribute(:status, "Paid")

    admin = create(:user, role: 1)
    login_user(admin)

    click_link "Cancel"
    expect(page).to have_content("Cancelled")
  end

  scenario "cancel 'ordered' order" do
    create(:order_with_items)
    admin = create(:user, role: 1)
    login_user(admin)

    click_on "Cancel"

    expect(page).to have_content("Cancelled")
  end

  scenario "change 'ordered' order to 'paid'" do
    order_ordered = create(:order_with_items)
    order_ordered.update_attribute(:status, "Ordered")
    admin = create(:user, role: 1)
    login_user(admin)

    click_on "Mark As Paid"

    expect(page).to have_content("Paid")
  end

  scenario "change 'paid' order to 'completed'" do
    create(:order_with_items, status: "Paid")

    admin = create(:user, role: 1)
    login_user(admin)

    click_on "Mark As Completed"

    expect(page).to have_content("Completed")
  end
end
