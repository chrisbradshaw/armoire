class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :name
      t.string :element
      t.string :style
      t.string :color
      t.string :occasion
      t.string :season
      t.boolean :worn
      
      t.timestamps null: false
    end
  end
end
