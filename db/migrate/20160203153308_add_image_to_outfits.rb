class AddImageToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :image, :string
  end
end
