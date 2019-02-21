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


class Enterprise < ApplicationRecord
  belongs_to :user
end
