FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    family_name           { '佐藤' }
    first_name            { '太郎' }
    family_name_kana      { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '20221010' }
  end
end
