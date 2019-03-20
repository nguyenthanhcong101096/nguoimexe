# frozen_string_literal: true

# == Schema Information
#
# Table name: post_views
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  user_id    :integer
#  ip_address :inet             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostView < ApplicationRecord
  belongs_to :post

  counter_culture :post, column_name: 'views_count'

  def self.threshold
    4.hours.ago
  end
end
