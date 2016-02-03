class Outfit < ActiveRecord::Base
  validates :user_id, :garment_id, :shoe_id, :accessory_id, presence: true

  belongs_to :garment
  belongs_to :accessory
  belongs_to :shoe
  belongs_to :user

  validates_uniqueness_of(
    :user_id,
    scope: [ :garment_id, :accessory_id, :shoe_id],
    message: "This combination is saved already for the current user."
  )

  enum action: [:pending, :approve, :reject]

  # ActiveRecord:Enum default is 0 (pending) set in migration
  # user selects 1 for approve, 2 for reject

  def self.random_accessory
      random_accessory_id = Accessory.pluck(:id).sample
    # we're using pluck because we want an array w available accessory ids
    # then sample because we want just 1
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
