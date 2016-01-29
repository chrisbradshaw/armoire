class AddUserToOutfits < ActiveRecord::Migration
  def change
    add_reference :outfits, :user, index: true, foreign_key: true
  end
end
