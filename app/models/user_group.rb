# frozen_string_literal: true

# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  user_id    :bigint(8)
#  group_id   :bigint(8)
#  role       :string           default("member")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
