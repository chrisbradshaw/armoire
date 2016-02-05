class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followed, index: true

      t.timestamps null: false
    end
  end
end
