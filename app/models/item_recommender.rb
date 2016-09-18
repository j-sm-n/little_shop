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
end
