# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  context          :string(500)      not null
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_create_commit { RenderCommentJob.perform_later self }

  delegate :username, :avatar_url, to: :user, prefix: true
end
