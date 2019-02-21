# frozen_string_literal: true

# == Schema Information
#
# Table name: user_chats
#
#  id              :integer          not null, primary key
#  conversation_id :bigint(8)        not null
#  user_id         :bigint(8)        not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


FactoryBot.define do
  factory :user_chat do
  end
end
