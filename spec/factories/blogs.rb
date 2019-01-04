# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    title { 'MyString' }
    content { 'MyText' }
    img_data { 'MyText' }
  end
end
