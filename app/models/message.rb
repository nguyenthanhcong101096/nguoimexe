# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  msg             :text
#  attachment_data :text
#  conversation_id :bigint(8)        not null
#  sender_id       :bigint(8)        not null
#  read            :boolean          default(FALSE)
#  check           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: User

  after_create_commit { MessageJob.perform_later self }

  delegate :username, :id, :avatar_url, to: :sender, prefix: true
  delegate :name, to: :conversation

  include ImageUploader::Attachment.new(:attachment)

  def self.read_message(user)
    messages = where.not(sender: user)
    messages.last.update(read: true) if messages.count > 0
  end

  def created_date
    created_at.strftime('%b %d')
  end
end
