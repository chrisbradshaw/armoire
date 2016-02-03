class Image < ActiveRecord::Base
  attr_accessor :image, :image_name, :image_cache
  mount_uploader :image, ImagesUploader
end
