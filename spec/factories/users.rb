FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000000e'}
    password_confirmation {password}
    last_name             {'姫田'}
    first_name            {'嵩平'}
    kana_last_name        {'ヒメダ'}
    kana_first_name       {'シュウヘイ'}
    birth_date            {'2000-03-14'}
  end
end
