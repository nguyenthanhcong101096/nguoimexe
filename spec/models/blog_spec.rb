# frozen_string_literal: true
# == Schema Information
#
# Table name: blogs
#
#  id            :integer          not null, primary key
#  title         :string
#  content       :text
#  img_data      :text
#  user_id       :bigint(8)
#  kind          :string           default("newfeed")
#  mod           :string           default("public")
#  like_count    :integer
#  view_count    :integer
#  comment_count :integer
#  slug_title    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Blog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
