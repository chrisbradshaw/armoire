class AddStatusToOutfit < ActiveRecord::Migration
  def change
    add_column :outfits, :action, :integer, default: 0
  end
end
