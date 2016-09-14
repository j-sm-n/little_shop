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
end
