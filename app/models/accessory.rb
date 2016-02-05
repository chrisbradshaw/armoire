class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  validates :image, presence: true

  attr_accessor :image_cache

  enum season: [:summer, :fall, :winter, :spring]


  def self.random_accessory
    random_accessory_id = Accessory.pluck(:id).sample
    Accessory.find(random_accessory_id)
  end
end
