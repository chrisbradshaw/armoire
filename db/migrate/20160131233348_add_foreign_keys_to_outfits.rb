class AddForeignKeysToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :garment_id, :integer
    add_column :outfits, :shoe_id, :integer
    add_column :outfits, :accessory_id, :integer
    remove_column :garments, :outfit_id
  end
end
