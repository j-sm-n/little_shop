require 'rails_helper'

RSpec.feature "User sees items in cart" do
  scenario "when cart has one item" do
    # Given items exist
    # As a visitor
    # When I visit any page with an item on it
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    # And I click a link or button to view cart
    # And my current path should be "/cart"
    # And I should see a small image, title, description and price for the item I just added
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    item = create(:item)

    visit items_path

    click_on "Add to Cart"

    expect(current_path).to eq(items_path)

    click_on "cart_link"

    expect(current_path).to eq("/cart")

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.price
    expect(page).to have_xpath("//img[@src='#{item.image_path}']")

    expect(page).to have_content("Total")
  end


  scenario "when cart has items" do
    # Given items exist
    # As a visitor
    # When I visit any page with an item on it
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    # And I click a link or button to view cart
    # And my current path should be "/cart"
    # And I should see a small image, title, description and price for the item I just added
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    item_1 = Item.create(title: "Banana",
                         description: "Wholesome Yellow Goodness",
                         price: 19,
                         image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg")

    item_2 = Item.create(title: "Apple",
                         description: "Wholesome Red Goodness",
                         price: 20,
                         image_path: "http://s4.thingpic.com/images/24/ykZQBGP2uXLiJLbXrt6VChMQ.jpeg")

    visit items_path

    within('.Banana') do
      click_on "Add to Cart"
    end

    within('.Apple') do
      click_on "Add to Cart"
    end

    expect(current_path).to eq(items_path)

    click_on "cart_link"

    expect(current_path).to eq("/cart")

    expect(page).to have_content item_1.title
    expect(page).to have_content item_1.description
    expect(page).to have_content item_1.price
    expect(page).to have_xpath("//img[@src='#{item_1.image_path}']")

    expect(page).to have_content item_2.title
    expect(page).to have_content item_2.description
    expect(page).to have_content item_2.price
    expect(page).to have_xpath("//img[@src='#{item_2.image_path}']")

    expect(page).to have_content("39")
  end
end
