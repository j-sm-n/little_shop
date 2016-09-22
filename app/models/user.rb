class User < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  has_secure_password

  has_many :orders
  has_many :ordered_items, through: :orders
  has_many :items, through: :ordered_items

  enum role: %w(default admin)

  def item_recommender
    @item_recommender ||= ItemRecommender.new(self)
  end
end
