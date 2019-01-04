# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    msg { Faker::Lorem.paragraph }
  end
end
