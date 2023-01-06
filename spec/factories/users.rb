FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'00000aa'}
    password_confirmation {password}
    first_name                {'山田'}
    family_name             {'圭'}
    family_name_kana            {'ヤマダ'}
    first_name_kana             {'ケイ'}
    birth_day             {'1990-4-15'}

  end
end