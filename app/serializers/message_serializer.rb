# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicle_kinds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :msg, :attachment, :sender_id, :conversation_name

  def conversation_name
    object.conversation.name
  end
end
