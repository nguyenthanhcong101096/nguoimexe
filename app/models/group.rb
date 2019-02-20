# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :user_groups, dependent: :destroy
end
