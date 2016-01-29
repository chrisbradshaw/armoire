class AddUserToShoes < ActiveRecord::Migration
  def change
    add_reference :shoes, :user, index: true, foreign_key: true
  end
end
