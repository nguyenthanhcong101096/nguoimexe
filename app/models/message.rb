# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  msg             :text
#  conversation_id :bigint(8)        not null
#  user_id         :bigint(8)        not null
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit { RenderMessageJob.perform_later self }

  delegate :username, :id, :avatar_url, to: :user, prefix: true
end
