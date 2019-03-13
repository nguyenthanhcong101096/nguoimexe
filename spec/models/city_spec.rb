# frozen_string_literal: true

# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string
#  province_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


require 'rails_helper'

RSpec.describe City, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
