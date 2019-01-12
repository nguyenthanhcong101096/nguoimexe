# frozen_string_literal: true

class FollowsController < ApplicationController
  include TrackNotificationActivity

  def create
    user = User.find(params[:user_id])
    raise AppErrors::Error409 if current_user.follow?(user.id)

    current_user.follow(user)
    push_notification(user, 'follow', "/users/#{user.id}")
    render json: { status: 'ok', message: 'success' }
  end

  def destroy
    user = current_user.following.find_by!(id: params[:user_id])
    current_user.unfollow(user)
    head(200)
  end
end
