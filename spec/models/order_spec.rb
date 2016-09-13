require "rails_helper"

RSpec.describe Order, type: :model do
  it "has user ID" do
    order = Order.new(user_id: 1)

    expect(order.user_id).to eq(1)
  end
  
  it { should have_many :ordered_items }
  it { should have_many :items }

end
