class ItemRecommender
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def item_purchase_count
    ids_with_quantities = user.ordered_items.group(:item_id).sum(:quantity)
    ids_with_quantities.transform_keys { |id| Item.find(id).title }
  end

  def item_frequency(item, time = Time.now)
    involved_order_ids = user.ordered_items.where(item_id: item.id).pluck(:order_id)
    earliest_order_time = Order.where(id: involved_order_ids).minimum(:updated_at)
    purchases_per_sec = item_purchase_count[item.title] / ( time - earliest_order_time )
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

  def recommended_items(item = top_item)
    order_ids_with_top_item = OrderedItem.where(item: item).where.not(order: user.orders).pluck(:order_id)
    items = Item.find(OrderedItem.where(order_id: order_ids_with_top_item).where.not(item: top_item).order(quantity: :desc).pluck(:item_id))
    clean_up_items(items, item)
  end

  def clean_up_items(items, item, limit_number = 3)
    items.delete(item)
    items[0..limit_number]
  end
end
