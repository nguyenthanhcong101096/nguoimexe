# frozen_string_literal: true

class VehicleKind < ApplicationRecord
  extend Enumerize

  has_many :posts, dependent: :destroy

  enumerize :name, in: %i[oto moto bike other], scope: true
end
