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

  it "has a status of 'Ordered'" do
    order = create(:order)
    order.items.create(title: "banana",
                       description: "Wholesome Yellow Goodness",
                       price: 19,
                       image_path: "placeholder-path")

    order.items.create(title: "tea",
                       description: "its tea...",
                       price: 80,
                       image_path: "placeholder-path")

    expect(order.status).to eq("ordered")
  end
end
