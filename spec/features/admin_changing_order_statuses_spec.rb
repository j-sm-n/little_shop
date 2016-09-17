require 'rails_helper'

RSpec.feature "Admin changing order statuses", type: :feature do
  # As an Admin
  # When I visit the dashboard
  # Then I can see a listing of all orders
  # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
  # And I can see a link for each individual order
  # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
  # And I have links to transition between statuses
  # - I can click on "cancel" on individual orders which are "paid" or "ordered"
  # - I can click on "mark as paid" on orders that are "ordered"
  # - I can click on "mark as completed" on orders that are "paid"
  scenario "sees all orders with statuses on dashboard" do

  end

  scenario "filter orders by status" do

  end

  scenario "cancel 'paid' or 'ordered' order" do

  end

  scenario "change 'ordered' order to 'paid'" do

  end

  scenario "change 'paid' order to 'completed'" do
    
  end
end
