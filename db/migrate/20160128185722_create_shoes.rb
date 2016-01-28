class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|

      t.timestamps null: false
    end
  end
end
