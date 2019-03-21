class CloundinaryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    upload_to_cloudinary(args.first, args.last)
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
end
