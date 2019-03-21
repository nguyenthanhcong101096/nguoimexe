# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicle_kinds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VehicleKindSerializer < ActiveModel::Serializer
  has_many :brands

  attributes :name
end
