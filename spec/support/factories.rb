FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| "Dead Dove #{n}" }
    description "I don't know what I expected"
    price 19
    image_path "i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg"

    factory :item_with_long_description do
      long_description "Sometimes you have to return"\
      "a dead dove. You really don't want your brother, or"\
      "anyone else eating it. This is an Arrested "\
      "Development joke, in case you missed that"
    end
  end

  sequence :username, %w(a b c d).cycle do |n|
    "Joe #{n}"
  end

  factory :user do
    username
    password "123foo456"
    password_confirmation "123foo456"
    gender "Other"
  end

  factory :ordered_item do
    item
    order
  end

  factory :order do
    status "paid"
    user

    factory :order_with_items do
      items { create_list(:item, 3) }
    end
  end
end
