# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    context { Faker::Lorem.paragraph }
  end
end
