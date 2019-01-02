FactoryBot.define do
  factory :message do
    msg { Faker::Lorem.paragraph }
  end
end
