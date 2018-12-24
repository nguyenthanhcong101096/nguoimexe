FactoryBot.define do
  factory :comment do
    context { Faker::Lorem.paragraph }
  end
end
