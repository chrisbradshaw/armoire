class AddImagesToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :image, :string
    add_column :shoes, :image_name, :string
    add_column :shoes, :image_url, :string
  end
end
