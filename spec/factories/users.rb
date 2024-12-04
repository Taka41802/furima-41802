FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { 'password123' }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '太郎' }
    last_name_ruby        { 'スズキ' }
    first_name_ruby       { 'タロウ' }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
