# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    kind { 'MyString' }
    message { 'MyString' }
    url { 'MyString' }
  end
end
