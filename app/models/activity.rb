class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  def self.track(user_target, post_id, kind, message)
    activity = Activity.new(user: user_target, post_id: post_id, kind: kind, message: message)
    ApplicationRecord.transaction do
      activity.save!
    end
  end
end
