FactoryBot.define do
  factory :item do
    image           {"11"}
      product       {"apple"}
      price            {111}
      info          {"aaa"}
      condition_id      {1}
      postage_type_id   {1}
      days_to_ship_id   {1}
      prefecture_id     {1}
      category_id       {1}
      association :user
    end
  
  end
