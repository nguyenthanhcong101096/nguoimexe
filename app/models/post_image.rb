class PostImage < ApplicationRecord
  belongs_to :posts
  include ImageUploader::Attachment.new(:post_image)
  
  def self.create_img_post(params, post)
    params[:pictures].map do |pic|
      post.post_images.create(post_image: pic)
    end 
  end
end
