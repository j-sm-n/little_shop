class Cart
  attr_reader :contents

  def initialize(contents = nil)
    @contents = contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def quantity(item_id)
    contents[item_id.to_s]
  end

  def total_price
    items = Item.where(id: contents.keys)
    items.reduce(0) { |sub_total, item| sub_total + item.price * quantity(item.id) }
  end

end
