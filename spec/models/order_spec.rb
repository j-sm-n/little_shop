require "rails_helper"

RSpec.describe Order, type: :model do
  it "has user ID" do
    order = Order.new(user_id: 1)

    expect(order.user_id).to eq(1)
  end

  it { should have_many :ordered_items }
  it { should have_many :items }

  it "has a total" do
    order = create(:order)
    order.items.create(title: "banana",
                       description: "Wholesome Yellow Goodness",
                       price: 19,
                       image_path: "placeholder-path")

    order.items.create(title: "tea",
                       description: "its tea...",
                       price: 80,
                       image_path: "placeholder-path")

    expect(order.total).to eq(99)
  end

  it "has item quantity" do
    order = create(:order)
    banana = Item.create(title: "banana",
                       description: "Wholesome Yellow Goodness",
                       price: 19,
                       image_path: "placeholder-path")

    3.times do
      order.ordered_items.create(item: banana)
    end

    expect(order.quantity(banana.id)).to eq(3)
  end

  it "has item subtotal" do
    order = create(:order)
    banana = Item.create(title: "banana",
                       description: "Wholesome Yellow Goodness",
                       price: 19,
                       image_path: "placeholder-path")

    3.times do
      order.ordered_items.create(item: banana)
    end

    expect(order.subtotal(banana.id)).to eq(3*banana.price)
  end

  context "statuses" do
    it "has a status" do
      order = create(:order)
      order.items.create(title: "banana",
                         description: "Wholesome Yellow Goodness",
                         price: 19,
                         image_path: "placeholder-path")

      order.items.create(title: "tea",
                         description: "its tea...",
                         price: 80,
                         image_path: "placeholder-path")

      expect(order.status).to eq("Ordered")
    end

    it "can change status" do
      order = create(:order)
      order.change_status("amazing order")

      expect(order.status).to eq("amazing order")
    end
  end
end
