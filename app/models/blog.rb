# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:img)

  delegate :username, :id, :avatar_url, to: :user, prefix: true

  def created_date
    created_at.strftime('%d %b. %Y')
  end
end
