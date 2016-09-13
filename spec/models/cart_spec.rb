require "rails_helper"

RSpec.describe Cart, type: :model do
  it "has contents of id and quantity" do
    cart_contents = {"1" => 2, "53" => 4}
    cart = Cart.new(cart_contents)

    expect(cart.contents).to eq(cart_contents)
  end

  it "adds items to cart" do
    cart = Cart.new

    cart.add_item("53")

    expect(cart.contents).to eq({"53" => 1})
  end
end
