class Order < ApplicationRecord
  has_many :ordered_items
end
