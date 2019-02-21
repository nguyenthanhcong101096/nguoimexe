# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id             :integer          not null, primary key
#  user_id        :bigint(8)        not null
#  target_user_id :bigint(8)        not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'
  
  counter_culture :target_user, column_name: 'followers_count'
  counter_culture :user, column_name: 'following_count'
end
