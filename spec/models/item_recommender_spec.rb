require "rails_helper"

RSpec.describe ItemRecommender, type: :model do
  it "finds number of times a item has been bought" do
    user = create(:user)
    banana = Item.create(title: "Banana", description: "banana!", price: "21", image_path: "foo.com")
    order_1 = Order.create(user: user)

    order_1.ordered_items.create(item: banana, quantity: 4)

    order_1.status = "Completed"

    order_2 = Order.create(user: user)

    order_2.ordered_items.create(item: banana, quantity: 6)
    order_2.status = "Completed"

    ir = ItemRecommender.new(user)

    expect(ir.item_purchase_count).to eq("Banana" => 10)
  end

  it "finds purchase frequency of single item" do
    user = create(:user)
    banana = Item.create(title: "Banana", description: "banana!", price: "21", image_path: "foo.com")
    order_1 = Order.create(user: user)

    order_1.ordered_items.create(item: banana, quantity: 4)

    order_1.status = "Completed"
    order_1.update_attribute(:updated_at, Time.parse("September 11"))

    order_2 = Order.create(user: user)

    order_2.ordered_items.create(item: banana, quantity: 3)

    order_2.status = "Completed"
    order_2.update_attribute(:updated_at, Time.parse("September 16"))

    ir = ItemRecommender.new(user)

    expect(ir.item_frequency(banana, Time.parse("September 18"))).to eq(1)
  end

  it "lists user's most frequently purchased items by frequency" do
    user = create(:user)
    banana = Item.create(title: "Banana", description: "banana!", price: "21", image_path: "foo.com")
    apple = Item.create(title: "Apple", description: "apple!", price: "24", image_path: "foo.com")
    soap = Item.create(title: "Soap", description: "soap!", price: "100", image_path: "foo.com")

    order_1 = Order.create(user: user)

    order_1.ordered_items.create(item: banana, quantity: 4)

    order_1.status = "Completed"
    order_1.update_attribute(:updated_at, Time.parse("August 11"))

    order_2 = Order.create(user: user)

    order_2.ordered_items.create(item: apple, quantity: 3)

    order_2.status = "Completed"
    order_2.update_attribute(:updated_at, Time.parse("September 18"))

    order_3 = Order.create(user: user)
    order_3.ordered_items.create(item: soap)
    order_3.update_attribute(:updated_at, Time.parse("September 01"))

    ir = ItemRecommender.new(user)

    expect(ir.top_user_items.first).to eq(apple)
    expect(ir.top_user_items[1]).to eq(banana)
    expect(ir.top_user_items.last).to eq(soap)
  end

  it "knows items bought by users who bought the same item" do
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

    ir_1 = ItemRecommender.new(user_1)
    ir_2 = ItemRecommender.new(user_2)

    expect(ir_1.recommended_items.first).to eq(soap)
    expect(ir_2.recommended_items.first).to eq(apple)
  end
end
