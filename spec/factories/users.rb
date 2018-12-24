FactoryBot.define do
  factory :user do
    phone { Faker::Number.number(10) }
    username { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
