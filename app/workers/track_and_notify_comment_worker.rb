class TrackAndNotifyCommentWorker
  include Sidekiq::Worker
  
  def perform(user_id, post_id, kind, message)
    user_target = User.find(user_id)
    Activity.track(user_target, post_id, kind, message)
  end
end
