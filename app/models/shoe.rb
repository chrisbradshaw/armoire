class Shoe < ActiveRecord::Base


  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImagesUploader
end
