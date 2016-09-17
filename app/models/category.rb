class Category < ApplicationRecord
  has_many :items

  validates :slug, presence: true

  def initialize(*args)
    super
    update_attribute(:slug, name.downcase.tr(" ", "-"))
  end

  def to_param
    slug
  end
end
