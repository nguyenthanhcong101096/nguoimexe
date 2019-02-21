# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicle_kinds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :vehicle_kind do
    name { %i[oto moto bike other].sample }
  end
end
