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

class UserChat < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: User
end
