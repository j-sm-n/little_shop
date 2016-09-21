require "rails_helper"

RSpec.feature "User sees recommended items" do
  scenario "based on the item user is viewing" do
    user_1 = create(:user)
    user_2 = create(:user)
    banana = Item.create(title: "Banana", description: "banana!", price: "21", image_path: "foo.com")
    apple = Item.create(title: "Apple", description: "apple!", price: "24", image_path: "foo.com")
    soap = Item.create(title: "Soap", description: "soap!", price: "100", image_path: "foo.com")

    order_1 = Order.create(user: user_1)

    order_1.ordered_items.create(item: banana, quantity: 4)

    order_1.ordered_items.create(item: apple, quantity: 2)

    order_2 = Order.create(user: user_2)

    order_2.ordered_items.create(item: banana, quantity: 3)
    order_2.ordered_items.create(item: soap, quantity: 2)
    order_2.ordered_items.create(item: apple)

    order_3 = Order.create(user: user_2)

    order_3.ordered_items.create(item: soap, quantity: 5)

    login_user(user_1)

    visit "/items/#{banana.id}"

    expect(current_path).to eq("/items/#{banana.id}")

    within(".recommended_items") do
      expect(page).to have_content("soap")
      expect(page).to have_content("apple")
    end
  end
end
