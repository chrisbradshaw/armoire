class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  attr_accessor :image_cache

  def self.random_accessory
    random_accessory_id = Accessory.pluck(:id).sample
    Accessory.find(random_accessory_id)
  end
end
