FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'00000aa'}
    first_name                {'test@example'}
    family_name             {'00000aa'}
    family_name_kana            {'00000aa'}
    first_name_kana             {'00000aa'}
    birth_day             {'00000aa'}
  end
end