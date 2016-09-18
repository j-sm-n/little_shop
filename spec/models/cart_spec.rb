require "rails_helper"

RSpec.describe Cart, type: :model do
  it "has contents of id and quantity" do
    cart_contents = {"1" => 2, "53" => 4}
    cart = Cart.new(cart_contents)

    expect(cart.contents).to eq(cart_contents)
  end

  it "adds item to cart" do
    cart = Cart.new

    cart.add_item("53")

    expect(cart.contents).to eq({"53" => 1})
  end

  it "add items to cart" do
    cart = Cart.new

    3.times do
      cart.add_item("53")
    end

    cart.add_item("1")

    expect(cart.contents).to eq({"53" => 3, "1" => 1})
  end

  it "knows item quantities" do
    cart = Cart.new

    3.times do
      cart.add_item("53")
    end

    expect(cart.quantity("53")).to eq(3)
  end

  it "finds item subtotal" do
    cart = Cart.new
    item = create(:item)

    2.times do
      cart.add_item(item.id)
    end

    expect(cart.item_subtotal(item.id)).to eq(2 * item.price)
  end

  it "finds cart total" do
    cart = Cart.new
    item = create(:item)
    item_2 = create(:item)
    item_2.update_attribute(:price, 200)

    2.times do
      cart.add_item(item.id)
    end
    cart.add_item(item_2.id)

    expect(cart.total_price).to eq(item.price * 2 + item_2.price)
  end

  it "can clear contents" do
    cart = Cart.new
    cart.add_item("53")

    cart.clear

    expect(cart.contents).to eq({})
  end
end
