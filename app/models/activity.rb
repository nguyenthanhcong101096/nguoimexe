# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'

  ACTIVITY_OF_KIND = [
    { kind: 'comment', message: ' đã bình luận bài viết của bạn' },
    { kind: 'follow', message: ' đã theo dõi bạn' },
    { kind: 'like', message: ' đã thích bài viết của bạn' }
  ].freeze

  def self.track(user, target_user, kind, url)
    user.activities.create(
      target_user: target_user,
      kind: kind,
      message: activity_message(kind, user.username),
      url: url
    )
  end

  def self.activity_message(kind, user_name)
    message = ACTIVITY_OF_KIND.find { |act| act[:kind] == kind }[:message]
    user_name.concat(message)
  end

  def self.counter(user)
    Activity.where(read: false, target_user: user).count
  end
end
