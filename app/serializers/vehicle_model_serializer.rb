# frozen_string_literal: true
# == Schema Information
#
# Table name: vehicle_models
#
#  id         :integer          not null, primary key
#  name       :string
#  brand_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VehicleModelSerializer < ActiveModel::Serializer
  attributes :id, :name
end
