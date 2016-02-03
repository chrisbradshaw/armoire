class Outfit < ActiveRecord::Base
  validates :user_id, :garment_id, :shoe_id, :accessory_id, presence: true

  belongs_to :garment
  belongs_to :accessory
  belongs_to :shoe
  belongs_to :user


  def self.random_accessory
      random_accessory_id = Accessory.pluck(:id).sample
      Accessory.find(random_accessory_id)
  end

  def self.random_garment
    random_garment_id = Garment.pluck(:id).sample
    Garment.find(random_garment_id)
end


    def self.random_shoe
    random_shoe_id = Shoe.pluck(:id).sample
    Shoe.find(random_shoe_id)
    end
end
