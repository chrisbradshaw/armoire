class AddOutfitIdToGarments < ActiveRecord::Migration
  def change
    add_reference :garments, :outfit, index: true, foreign_key: true
  end
end
