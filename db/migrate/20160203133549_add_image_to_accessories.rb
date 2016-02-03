class AddImageToAccessories < ActiveRecord::Migration
  def change
    add_column :accessories, :image, :string
  end
end
