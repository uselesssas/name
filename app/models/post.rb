# frozen_string_literal: true

class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
end
