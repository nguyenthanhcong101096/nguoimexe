# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  phone                  :string
#  encrypted_password     :string           default(""), not null
#  address                :string
#  username               :string
#  avatar_data            :text
#  slug_name              :string
#  range                  :string
#  status                 :string           default("offline")
#  followers_count        :integer
#  following_count        :integer
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  type_account           :string
#

FactoryBot.define do
  factory :user do
    phone { Faker::Number.number(10) }
    email { Faker::Internet.email }
    username { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
