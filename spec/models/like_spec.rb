# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :bigint(8)
#  likeable_id   :integer
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
