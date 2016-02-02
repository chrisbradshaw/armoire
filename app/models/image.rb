class Image < ActiveRecord::Base
  attr_accessible :image, :image_name
  mount_uploader :image, ImagesUploader
end
