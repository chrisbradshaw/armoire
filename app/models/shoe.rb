class Shoe < ActiveRecord::Base
  
  validate :image_size_validation

  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImagesUploader

  private
  def image_size_validation

  end
end
