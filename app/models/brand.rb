# frozen_string_literal: true

# == Schema Information
#
# Table name: brands
#
#  id              :integer          not null, primary key
#  name            :string
#  vehicle_kind_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Brand < ApplicationRecord
  has_many :vehicle_models
  belongs_to :vehicle_kind
end
