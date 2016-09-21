class ItemRecommender
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def item_purchase_count
    ids_with_quantities = user.ordered_items.group(:item_id).sum(:quantity)
    ids_with_quantities.transform_keys{ |id| Item.find(id).title }
  end

  def item_frequency(item, time = Time.now)
    involved_order_ids = user.ordered_items.where(item_id: item.id).pluck(:order_id)
    earliest_order_time = Order.where(id: involved_order_ids).minimum(:updated_at)
    purchases_per_sec = item_purchase_count[item.title]/( time - earliest_order_time )
    (purchases_per_sec * (60 * 60 * 24)).round(3) # convert to orders/day for end user ease
  end

  def top_item
    top_item_title = item_purchase_count.key(item_purchase_count.values.max)
    @top_item ||= Item.find_by(title: top_item_title)
  end

  def top_user_items
    top_user_items = Item.where(id: user.ordered_items.order(quantity: :desc).pluck(:item_id))
    top_user_items.sort_by { |item| item_frequency(item) }.reverse
  end

  def recommended_items(item = top_item, number = 3)
    order_ids_with_top_item = OrderedItem.where(item: top_item).where.not(order: user.orders).pluck(:order_id)
    orders_with_top_item = Order.where(id: order_ids_with_top_item)
    items = Item.find(OrderedItem.where(order: orders_with_top_item).where.not(item: top_item).order(quantity: :desc).pluck(:item_id))
    items.delete(item)
    items[0..number]
  end
end
