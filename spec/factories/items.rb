FactoryBot.define do
  factory :item do
    name                { 'frog' }
    explanation         { '状態は良好です。' }
    category_id         { 2 }
    condition_id        { 2 }
    delivery_fee_id     { 2 }
    area_id             { 2 }
    delivery_day_id     { 2 }
    price               { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
