# frozen_string_literal: true
# == Schema Information
#
# Table name: room_chats
#
#  id              :integer          not null, primary key
#  conversation_id :bigint(8)        not null
#  sender_id       :bigint(8)        not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :room_chat do
  end
end
