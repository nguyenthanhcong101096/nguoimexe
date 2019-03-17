# frozen_string_literal: true

class PostView < ApplicationRecord
  belongs_to :user
  belongs_to :post

  counter_culture :post, column_name: 'views_count'

  def self.threshold
    4.hours.ago
  end
end
