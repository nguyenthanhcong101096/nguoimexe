# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :user_id
    identified_by :room_id

    def connect
      self.user_id = find_verified_user
      self.room_id = current_conversation
    end

    def disconnect; end

    protected

    def find_verified_user
      if current_user = User.find_by(id: cookies.signed[:user_id])
        current_user.id
      else
        reject_unauthorized_connection
      end
    end

    def current_conversation
      cookies.signed[:room_id]
    end
  end
end
