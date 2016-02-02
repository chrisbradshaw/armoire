class Shoe < ActiveRecord::Base
    attr_accessor :image_cache
    
  belongs_to :user
  has_many :outfits
  mount_uploader :images, ImagesUploader
end
