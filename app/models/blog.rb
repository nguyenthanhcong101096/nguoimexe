class Blog < ApplicationRecord
  belongs_to :user
  
  include ImageUploader::Attachment.new(:img)
  
  delegate :username, :id, :avatar_url, to: :user, prefix: true
end
