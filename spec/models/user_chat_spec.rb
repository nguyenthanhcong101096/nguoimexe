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

require 'rails_helper'

RSpec.describe UserChat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
