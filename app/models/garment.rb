class Garment < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  attr_accessor :image_cache

  validates :image, presence: true

  enum season: [:summer, :fall, :winter, :spring]

  def self.random_garment
    random_accessory_id = Garment.pluck(:id).sample
    Garment.find(random_accessory_id)
  end
end
