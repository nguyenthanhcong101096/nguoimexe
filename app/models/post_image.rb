# frozen_string_literal: true

class PostImage < ApplicationRecord
  belongs_to :post_imageable, polymorphic: true

  include ImageUploader::Attachment.new(:post_image)
end
