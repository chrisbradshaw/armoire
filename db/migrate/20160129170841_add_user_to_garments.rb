class AddUserToGarments < ActiveRecord::Migration
  def change
    add_reference :garments, :user, index: true, foreign_key: true
  end
end
