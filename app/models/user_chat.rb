# frozen_string_literal: true

class UserChat < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
end
