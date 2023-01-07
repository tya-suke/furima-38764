FactoryBot.define do
  factory :item do
      image {"aa"}
      product       {"apple"}
      price            {400}
      info          {"aaa"}
      condition_id      {1}
      postage_type_id   {1}
      days_to_ship_id   {1}
      prefecture_id     {1}
      category_id       {1}

      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
      end 
  
  end
end