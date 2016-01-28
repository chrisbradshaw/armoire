class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|

      t.timestamps null: false
    end
  end
end
