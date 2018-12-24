# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :remote_url, max_size: 2 * 1024 * 1024
  plugin :processing
  plugin :versions
  plugin :delete_raw, storages: [:store]

  Attacher.validate do
    validate_max_size 5.megabytes, message: 'is too large (max is 5 MB)'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  end
end
