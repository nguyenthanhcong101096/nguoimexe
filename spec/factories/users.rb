FactoryBot.define do
  factory :user do
    phone { Faker::PhoneNumber }
    username { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
