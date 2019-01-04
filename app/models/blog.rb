class Blog < ApplicationRecord
  belongs_to :user
  
  include ImageUploader::Attachment.new(:img)
end
