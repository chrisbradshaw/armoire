class Garment < ActiveRecord::Base
  belongs_to :user
  has_many :outfits

  def self.random_garment
    random_accessory_id = Garment.pluck(:id).sample
    Garment.find(random_accessory_id)
  end

end
