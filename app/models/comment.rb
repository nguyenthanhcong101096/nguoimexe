# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_create_commit { RenderCommentJob.perform_later self }
  
  delegate :username, :avatar_url, to: :user, prefix: true
end
