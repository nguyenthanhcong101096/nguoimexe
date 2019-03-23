# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  has_many :room_chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :room_members, through: :room_chats, source: :sender
  
  def with_user(user)
    room_members.reject { |usr| usr == user }[0]
  end

  def last_message
    messages.last
  end
  
  def check_read_message(user)
    messages.where.not(sender: user).last
  end
end
