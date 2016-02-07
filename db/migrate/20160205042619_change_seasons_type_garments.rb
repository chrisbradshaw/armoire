class ChangeSeasonsTypeGarments < ActiveRecord::Migration
  def up
    Garment.reset_column_information
    Garment.update_all(season: '0')
    Shoe.reset_column_information
    Shoe.update_all(season: '0')
    Accessory.reset_column_information
    Accessory.update_all(season: '0')
    change_column :garments, :season, 'integer USING CAST(season AS integer)', null: false
    change_column :shoes, :season, 'integer USING CAST(season AS integer)', null: false
    change_column :accessories, :season, 'integer USING CAST(season AS integer)', null: false
  end

  def down
    change_column :garments, :season, :string
    change_column :shoes, :season, :string
    change_column :accessories, :season, :string
  end
end
