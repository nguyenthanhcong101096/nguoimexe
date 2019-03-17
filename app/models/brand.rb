# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :vehicle_models
  belongs_to :vehicle_kind
end
