class User < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: true

  has_secure_password

  has_many :orders
  has_many :ordered_items, through: :orders
  has_many :items, through: :ordered_items

  enum role: %w(default admin)
end
