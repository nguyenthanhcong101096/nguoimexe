FactoryBot.define do
  factory :notification do
    post { nil }
    comment { nil }
    user { nil }
    read { false }
  end
end
