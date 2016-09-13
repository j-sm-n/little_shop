require "rails_helper"

RSpec.decribe Order, type: :model do
  it { should have_many :ordered_items }
  it { should have_many :items }

  it "has user ID" do
    order = Order.new(user_id: 1)

    expect(order.user_id).to eq(1)
  end
end
