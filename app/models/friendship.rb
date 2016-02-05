class Friendship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates_uniqueness_of :follower_id, scope: :followed_id
end
