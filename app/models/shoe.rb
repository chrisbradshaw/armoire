class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :outfits
end
