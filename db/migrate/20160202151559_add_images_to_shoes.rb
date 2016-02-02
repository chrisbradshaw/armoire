class AddImagesToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :images, :string
  end
end
