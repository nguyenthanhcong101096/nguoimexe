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

require 'rails_helper'

RSpec.describe Interprise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
