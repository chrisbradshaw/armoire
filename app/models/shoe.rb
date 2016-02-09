class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
  mount_uploader :image, ImageUploader

  attr_accessor :image_cache

  enum season: [:summer, :fall, :winter, :spring]

  def self.random_shoe(user_id)
    Shoe.where(user_id: user_id).sample
  end

end
