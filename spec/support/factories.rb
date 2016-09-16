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

  factory :user do
    username "Joe"
    password "123foo456"
    password_confirmation "123foo456"
    gender "Other"
  end

  
end
