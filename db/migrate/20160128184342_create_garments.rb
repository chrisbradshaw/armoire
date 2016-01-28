class CreateGarments < ActiveRecord::Migration
  def change
    create_table :garments do |t|

      t.timestamps null: false
    end
  end
end
