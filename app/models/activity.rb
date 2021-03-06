# frozen_string_literal: true

# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  user_id        :bigint(8)        not null
#  target_user_id :bigint(8)        not null
#  kind           :string
#  message        :string
#  url            :string
#  read           :boolean          default(FALSE)
#  check          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'

  after_create_commit { NotificationJob.perform_later self }

  ACTIVITY_OF_KIND = [
    { kind: 'comment', message: ' đã bình luận bài viết của bạn' },
    { kind: 'follow', message: ' đã theo dõi bạn' },
    { kind: 'like', message: ' đã thích bài viết của bạn' }
  ].freeze

  delegate :username, :avatar_url, to: :user, prefix: true

  def self.track(user, target_user, kind, url)
    user.activities.create(
      target_user: target_user,
      kind: kind,
      message: activity_message(kind, user.username),
      url: url
    )
  end

  def self.activity_message(kind, _user_name)
    message = ACTIVITY_OF_KIND.find { |act| act[:kind] == kind }[:message]
  end

  def self.counter(user)
    Activity.where(read: false, target_user: user).count
  end

  def created_date
    created_at.strftime('%b %d')
  end
end
