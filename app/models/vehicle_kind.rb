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

class VehicleKind < ApplicationRecord
  extend Enumerize

  has_many :posts, dependent: :destroy
  has_many :brands, dependent: :destroy
  
  enumerize :name, in: %i[oto moto bike other], scope: true

  scope :with_kind, ->(kind) { find_by!(name: kind) }
end
