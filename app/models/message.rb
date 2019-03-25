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

  validates :msg, presence: true
  after_create_commit { MessageJob.perform_later self }

  delegate :username, :id, :avatar_url, to: :sender, prefix: true

  include ImageUploader::Attachment.new(:attachment)

  scope :read_message, ->(user) { where.not(sender: user).last.update(read: true) }

  def created_date
    created_at.strftime('%b %d')
  end
end
