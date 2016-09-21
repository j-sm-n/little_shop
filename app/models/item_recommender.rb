class ItemRecommender
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def item_purchase_count
    user.items.group(:title).count
  end

  def item_frequency(item, time = Time.now)
    involved_order_ids = user.ordered_items.where(item_id: item.id).distinct.pluck(:order_id)
    earliest_order_time = Order.where(id: involved_order_ids).minimum(:updated_at)
    purchases_per_sec = item_purchase_count[item.title]/( time - earliest_order_time )
    purchases_per_day = (purchases_per_sec * (60 * 60 * 24)).round(3)
  end

  def top_user_items
    user.items.distinct.sort_by { |i| item_frequency(i) }.reverse
  end

  def recommended_items
    # byebug
    top_user_item_name = item_purchase_count.key(item_purchase_count.values.max)
    top_item = Item.find_by(title: top_user_item_name)
    order_ids_with_top_item = OrderedItem.where(item: top_item).where.not(order_id: user.orders.ids).pluck(:order_id)
    orders_with_top_item = Order.where(id: order_ids_with_top_item)
    # byebug
    thing = orders_with_top_item.map do |order|
      # byebug
      if order.quantity_sorted_items.first != top_item
        order.quantity_sorted_items.first
      else
        order.quantity_sorted_items.uniq[1]
      end
    end
    # byebug
    thing
    # thing = orders_with_top_item.max_by do |order|
    #   title_count = order.items.group(:title).count
    #   title_count.key(title_count.values.max)
    # end
    # thing
  end
end
