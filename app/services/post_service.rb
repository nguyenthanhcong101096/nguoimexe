# frozen_string_literal: true

class PostService
  TYPE = { post: 'post', blog: 'blog', newsfeed: 'newsfeed' }.freeze

  def initialize(*variables, post: nil)
    @current_user, @params, @type = variables
    @post = post
  end

  def create
    case @type
    when TYPE[:post]
      create_post
    when TYPE[:blog]
      create_blog
    when TYPE[:newsfeed]
      create_newsfeed
    end
  end

  def destroy
    # delete_img_cloudinary
    @post.destroy
  end

  def create_post
    @current_user.posts.create(@params)
    # upload_to_cloudinary
  end

  def create_newsfeed
    # code here
  end

  def create_blog
    # #code here
  end

  private

  def upload_to_cloudinary
    images.each { |image| Cloudinary::Uploader.upload(image, public_id: 'random', overwrite: true) }
  end

  def delete_img_cloudinary
    @post.post_images { |_image| Cloudinary::Api.delete_resources(['nguoimexe/my_dog']) }
  end
end
