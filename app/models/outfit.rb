class Outfit < ActiveRecord::Base
  validates :user_id, :garment_id, :shoe_id, :accessory_id, presence: true
  
  belongs_to :garment
  belongs_to :accessory
  belongs_to :shoe
  belongs_to :user
  
end
