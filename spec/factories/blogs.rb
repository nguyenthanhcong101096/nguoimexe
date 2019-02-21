# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  img_data   :text
#  user_id    :bigint(8)
#  kind       :string           default("newfeed")
#  mod        :string           default("public")
#  slug_title :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :blog do
    content { 'BLV Quang Huy: Tuyển Việt Nam phải kiên nhẫn nếu muốn hạ Jordan' }
  end
end
