# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  msg             :text
#  conversation_id :bigint(8)        not null
#  sender_id       :bigint(8)        not null
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :message do
    msg { Faker::Lorem.paragraph }
  end
end
