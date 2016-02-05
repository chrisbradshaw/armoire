class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  attr_accessor :image_cache

    enum season: [:summer, :fall, :winter, :spring]

  def self.random_shoe
    random_accessory_id = Shoe.pluck(:id).sample
    Shoe.find(random_accessory_id)
  end
end
