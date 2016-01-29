class Outfit < ActiveRecord::Base

  has_many :garments
  has_many :accessories
  has_many :shoes
  has_many :users, through: :garments
  
end
