class AddUserToAccessories < ActiveRecord::Migration
  def change
    add_reference :accessories, :user, index: true, foreign_key: true
  end
end
