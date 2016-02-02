class Outfit < ActiveRecord::Base
  validates :user_id, :garment_id, :shoe_id, :accessory_id, presence: true

  belongs_to :garment
  belongs_to :accessory
  belongs_to :shoe
  belongs_to :user

  def self.random_outfit
    random_garment_id = Garment.pluck(:id).sample
    random_shoe_id = Shoe.pluck(:id).sample
    random_accesory_id = Accessory.pluck(:id).sample
    Outfit.new(garment_id: random_garment_id, shoe_id: random_shoe_id, accessory_id: random_accesory_id)
  end
end
