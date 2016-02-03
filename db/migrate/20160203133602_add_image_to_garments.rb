class AddImageToGarments < ActiveRecord::Migration
  def change
    add_column :garments, :image, :string
  end
end
