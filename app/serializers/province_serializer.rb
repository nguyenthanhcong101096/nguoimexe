# frozen_string_literal: true

class ProvinceSerializer < ActiveModel::Serializer
  has_many :cities

  attributes :name
end
