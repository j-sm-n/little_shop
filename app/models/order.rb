class Order < ApplicationRecord
  has_many :ordered_items
  belongs_to :user
  has_many :items, through: :ordered_items

  def quantity(item_id)
    items.where(id: item_id).count
  end

  def subtotal(item_id)
    items.find(item_id).price * quantity(item_id)
  end

  def total
    items.sum(:price)
  end

  def change_status(status)
    update_attribute(:status, status)
  end

  def distinct_items
    items.distinct
  end
end
