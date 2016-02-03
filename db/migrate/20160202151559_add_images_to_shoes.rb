class AddImagesToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :image, :string
  end
end
