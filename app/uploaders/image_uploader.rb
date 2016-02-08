# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process scale: [200, 300]

  def scale(width = 200, height = 300)
  end

  process :store_dimensions

  version :show do
    process resize_to_limit: [500, 500]
    process :store_dimensions
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  private

  def store_dimensions
  end
end
