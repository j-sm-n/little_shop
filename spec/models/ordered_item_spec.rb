require "rails_helper"

RSpec.describe OrderedItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :order }

  it "should have quantity" do
    ordered_item = OrderedItem.new(order_id: 1, item_id: 1, quantity: 21)
    expect(ordered_item.quantity).to eq(21)
  end
end
