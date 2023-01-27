FactoryBot.define do
  factory :item_form do
      post_code             { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
      prefecture_id         { Faker::Number.between(from: 1, to: 47) }
      city                  { Faker::Address.city }
      address               { "住所" }
      building              { "1005" }
      phone_number          { Faker::Number.decimal_part(digits: 11) }
      token                 { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
