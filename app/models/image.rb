class Image < ActiveRecord::Base
  attr_accessor :image, :image_cache
  mount_uploader :image, ImageUploader
end
