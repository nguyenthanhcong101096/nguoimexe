# frozen_string_literal: true

class PostService
  TYPE = { post: 'post', blog: 'blog', newsfeed: 'newsfeed' }.freeze

  def initialize(*variables)
    @current_user, @params, @type = variables
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

  def create_post
    post = @current_user.posts.create(@params[:params_post])
    if post.valid?
      upload_to_cloudinary(post, @params[:params_pics])
      true
    else
      false
    end
  end

  def create_newsfeed
    # code here
  end

  def create_blog
    # #code here
  end

  private

  def upload_to_cloudinary(post, images)
    images.each do |image|
      file_upload = Cloudinary::Uploader.upload(resize_image(image), folder: 'nguoimexe', public_id: image.original_filename, overwrite: true)

      PostImage.create(post_imageable: post, url: file_upload['secure_url'], public_id: image.original_filename)
    end
  end

  def resize_image(image)
    img = MiniMagick::Image.open(File.open(image.tempfile))
    img.resize('750x500')
    img.path
  end

  def delete_img_cloudinary
    @post.post_images { |_image| Cloudinary::Api.delete_resources(['nguoimexe/my_dog']) }
  end
end
