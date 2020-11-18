FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explanation {'かっこいい'}
    category_id {'レディース'}
    condition_id {'新品、未使用'}
    delivery_fee_id {'着払い（購入者負担）'}
    area_id {'北海道'}
    delivery_day_id {'1~2日で発送' }
    price  {500}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
