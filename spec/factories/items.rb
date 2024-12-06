FactoryBot.define do
  factory :item do
    association :user
    name              { Faker::Commerce.product_name }
    content           { Faker::Lorem.sentence }
    category_id       { 2 }
    condition_id      { 2 }
    burden_id         { 2 }
    area_id           { 2 }
    number_of_day_id  { 2 }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('app/assets/images/item-sample.png')), filename: 'item-sample.png')
    end
  end
end
