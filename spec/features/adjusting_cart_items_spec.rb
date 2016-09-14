require "rails_helper"

RSpec.feature do "User adjusts cart items" do
  scenario "cart page shows increased quantities" do
    # Given cart has item
    # As a visitor
    # When I visit "/cart"
    # Then I should see my item with a quantity of 1
    # And when I increase the quantity
    # Then my current page should be '/cart'
    # And that item's quantity should reflect the increase
    # And the subtotal for that item should increase
    # And the total for the cart should match that increase
    add_item_to_cart

    visit cart_path

    expect(page).to have_selector("input[value='1']")
    expect(page).to have_content("subtotal: $0.19")

    fill_in :quantity, with: "3"
    click_on "Update"

    expect(current_path).to eq(cart_path)

    expect(page).to have_selector("input[value='3']")
    expect(page).to have_content("subtotal: $0.57")
    expect(page).to have_content("total: $0.57")
  end

  scenario "cart page shows decreased quantities" do
    pending
    # Given cart has item
    # As a visitor
    # When I visit "/cart"
    # Then I should see my item with a quantity of 1
    # And when I decrease the quantity
    # Then my current page should be '/cart'
    # And that item's quantity should reflect the decrease
    # And the subtotal for that item should decrease
    # And the total for the cart should match that decrease
    add_item_to_cart

    visit items_path

    click_on "Add to Cart"

    visit cart_path

    expect(page).to have_selector("input[value='2']")
    expect(page).to have_content("subtotal: $0.38")

    fill_in :quantity, with: "1"
    click_on "Update"

    expect(current_path).to eq(cart_path)

    expect(page).to have_selector("input[value='1']")
    expect(page).to have_content("subtotal: $0.19")
    expect(page).to have_content("total: $0.19")
  end

  def add_item_to_cart
    item = Item.create(title: "Banana",
                       description: "Wholesome Yellow Goodness",
                       price: 19,
                       image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg")

    visit items_path

    click_on "Add to Cart"
  end
end
