class NotificationsController < ApplicationController
  def index
    @activities = Activity.where(target_user: current_user)
  end
end