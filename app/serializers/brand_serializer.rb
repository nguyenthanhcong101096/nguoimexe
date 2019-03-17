# frozen_string_literal: true

# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BrandSerializer < ActiveModel::Serializer
  has_many :vehicle_models

  attributes :id, :name
end
