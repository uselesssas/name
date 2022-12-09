# frozen_string_literal: true

class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 5.megabytes
    validate_mime_type %w[image/jpeg image/png image/webp]
  end
end
