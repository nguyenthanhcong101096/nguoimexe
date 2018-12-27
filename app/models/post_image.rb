class PostImage < ApplicationRecord
  belongs_to :post
  
  include ImageUploader::Attachment.new(:post_image)
end
