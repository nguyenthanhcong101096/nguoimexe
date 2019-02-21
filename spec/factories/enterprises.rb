# frozen_string_literal: true

# == Schema Information
#
# Table name: enterprises
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  phone      :string
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :enterprise do
    name { 'MyString' }
    address { 'MyString' }
    phone { 'MyString' }
  end
end
