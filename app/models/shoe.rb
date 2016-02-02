class Shoe < ActiveRecord::Base
    attr_accessor :image_cache

  belongs_to :user
  has_many :outfits
  mount_uploader :images, ImagesUploader

  def self.random_shoe
    random_accessory_id = Shoe.pluck(:id).sample
    Shoe.find(random_accessory_id)
  end

end
