# frozen_string_literal: true

class City < ApplicationRecord
  has_many :posts, dependent: :destroy

  belongs_to :province

  delegate :name, to: :province, prefix: true
end
