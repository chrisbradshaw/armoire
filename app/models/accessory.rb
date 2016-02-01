class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
end
