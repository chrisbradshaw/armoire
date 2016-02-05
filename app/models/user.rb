class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  has_many :shoes
  has_many :garments
  has_many :accessories
  has_many :outfits
  has_many :follower_friendships,
    foreign_key: 'follower_id',
    class_name: 'Friendship'

  # users that are followed by this user
  has_many :followed_users,
    through: :follower_friendships,
    source: 'followed',
    class_name: 'User'

  has_many :followed_friendships,
    foreign_key: 'followed_id',
    class_name: 'Friendship'

  # users who follow this user
  has_many :following_users,
    through: :followed_friendships,
    source: 'follower',
    class_name: 'User'

  validates :username,
            presence: true,
            uniqueness: {
              case_sensitive: false
            }

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  attr_writer :login

  def follow(another_user)
    Friendship.create(follower: self, followed: another_user)
  end

  def unfollow(another_user)
    Friendship.where(follower: self, followed: another_user).destroy_all
  end

  def is_following?(another_user)
    Friendship.where(follower: self, followed: another_user).present?
  end

  def is_followed_by?(another_user)
    Friendship.where(follower: another_user, followed: self).present?
  end

  def following_count
    follower_friendships.count
  end

  def followers_count
    followed_friendships.count
  end

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
