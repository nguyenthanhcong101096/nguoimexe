# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :bigint(8)
#  likeable_id   :integer
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


FactoryBot.define do
  factory :like do
  end
end
