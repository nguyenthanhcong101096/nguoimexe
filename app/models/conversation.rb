# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Conversation < ApplicationRecord
  has_many :user_chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :group_chats, through: :user_chats, source: :user

  def with_user(user)
    group_chats.reject { |usr| usr == user }[0]
  end

  def last_message
    messages.last
  end

  def count_msg_not_read(user)
    with_user(user).messages.where(conversation: self, read: false).count
  end
end
