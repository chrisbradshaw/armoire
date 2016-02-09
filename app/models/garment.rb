class Garment < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  attr_accessor :image_cache

  validates :image, presence: true

  enum season: [:summer, :fall, :winter, :spring]

 def self.random_garment(user_id)
    Garment.where(user_id: user_id).sample
  end
end
