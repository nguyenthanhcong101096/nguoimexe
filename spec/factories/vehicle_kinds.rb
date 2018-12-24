FactoryBot.define do
  factory :vehicle_kind do
    name { %i[oto moto bike other].sample }
  end
end
