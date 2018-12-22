FactoryBot.define do
  factory :user do
    # email { "no-name-#{Faker::Internet.email}"  }
    phone { Faker::PhoneNumber }
    username { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
