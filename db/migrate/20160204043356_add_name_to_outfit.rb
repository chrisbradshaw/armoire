class AddNameToOutfit < ActiveRecord::Migration
  def change
    add_column :outfits, :name, :string
  end
end
