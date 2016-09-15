class Category < ApplicationRecord
  has_many :items

  def to_param
    name.tr(" ", "_")
  end
end
