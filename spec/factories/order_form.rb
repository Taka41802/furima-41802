FactoryBot.define do
  factory :order_form do
    post_code       { '123-4567' }
    area_id         { 2 }
    municipality    { '横浜市緑区' }
    street_address  { '青山1-1-1' }
    building_name   { '柳ビル103' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
