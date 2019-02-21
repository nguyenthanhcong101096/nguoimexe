# frozen_string_literal: true

# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  user_id        :bigint(8)        not null
#  target_user_id :bigint(8)        not null
#  kind           :string
#  message        :string
#  url            :string
#  read           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


FactoryBot.define do
  factory :activity do
    kind { 'MyString' }
    message { 'MyString' }
    url { 'MyString' }
  end
end
