# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include RMagick or MiniMagick support:
  # include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :scale => [200, 300]

  def scale(width=200, height=300)

  end

  process :store_dimensions

  version :show do
    process :resize_to_limit => [500, 500]
    process :store_dimensions
  end



  def extension_white_list
    %w(jpg jpeg gif png)
  end

  private

  def store_dimensions
    # if file && model
    #   model.width, model.height = `identify -format "%wx%h" #{file.path}`.split(/x/)
    # end
  end


end
