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

class BrandSerializer < ActiveModel::Serializer
  has_many :vehicle_models

  attributes :id, :name
end
