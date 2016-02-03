class Image < ActiveRecord::Base
  attr_accessible :image, :image_name, :image_cache
  mount_uploader :image, ImagesUploader
end
