FactoryBot.define do
  factory :product do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name                 { Faker::Name.name }
    explanation          { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 1, to: 10) }
    condition_id         { Faker::Number.between(from: 1, to: 6) }
    shipping_cost_id     { Faker::Number.between(from: 1, to: 2) }
    prefecture_id        { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id      { Faker::Number.between(from: 1, to: 3) }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    # userのファクトリボットでデータを作成 （下に展開しているイメージ）
    # ２回書き込むから同じemailは登録できないためemailはFakerでランダムに作成する
    association :user
  end
end
