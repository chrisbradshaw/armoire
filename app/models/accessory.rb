class Accessory < ActiveRecord::Base
  belongs_to :user
  belongs_to :outfit
end
