# encoding: utf-8

class ImagesUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  # include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

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
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :normal do
  #   process :resize_to_fit => [200, 200]
  # end
  # version :show do
  #   process :resize_to_limit => [500, 500]
  #   process :store_dimensions
  # end

  version :thumb do
    # process :resize_to_fill => [500, 500]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # process :store_dimensions

  # If you like, you can call this inside a version like this
  # instead of at the top level.
  # That will store the dimensions for this version.
  version :show do
    process :resize_to_limit => [500, 500]
    process :store_dimensions
  end

  private

  def store_dimensions
    if file && model
      model.width, model.height = `identify -format "%wx%h" #{file.path}`.split(/x/)
    end
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def is_image? picture
    image = MiniMagick::Image.open(picture.path)
    image[width: 200] > image[height: 200]
  end
end
