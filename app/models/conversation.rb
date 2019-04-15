# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  name       :string
#  check      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  has_many :room_chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :room_members, through: :room_chats, source: :sender

  def with_users(user)
    room_members.reject { |usr| usr == user }
  end

  def last_message
    messages.last
  end

  def senders_last_message(user)
    messages.where.not(sender: user).last
  end

  def count_receiver_message(user)
    messages.where.not(sender: user).count
  end

  def read_messages(user)
    msg = messages.where(sender: user)
    msg.empty? ? true : msg.last.read
  end

  def name_groups
    name_conversation.presence || room_members.pluck(:username).join(', ')
  end

  def chat_groups?
    return true if room_members.count > 2

    false
  end
end
