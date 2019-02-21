# frozen_string_literal: true

# == Schema Information
#
# Table name: post_images
#
#  id                  :integer          not null, primary key
#  post_image_data     :text
#  post_imageable_id   :integer
#  post_imageable_type :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#


class PostImage < ApplicationRecord
  belongs_to :post_imageable, polymorphic: true

  include ImageUploader::Attachment.new(:post_image)
end
