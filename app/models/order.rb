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

  def quantity_sorted_items
    # ids = items.pluck(:ids)
    # byebug
    foo = items.to_a.sort_by do |item|
      quantity(item.id)
    end.reverse
    # byebug
    foo
  end
end
