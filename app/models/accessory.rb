class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  validates :image, presence: true

  attr_accessor :image_cache

  enum season: [:summer, :fall, :winter, :spring]

 def self.random_accessory(user_id)
    Accessory.where(user_id: user_id).sample
  end
end
