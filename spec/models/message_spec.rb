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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:msg) }
  end
end
