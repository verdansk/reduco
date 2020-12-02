class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transports
  has_many :housings
  has_many :emissions, through: :transports

  has_many :friendships
  has_many :friends, through: :friendships

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  def full_name
    first_name + " " + last_name
  end

  def all_friendships
    Friendship.where('user_id=? or friend_id=?',self.id,self.id)
  end
end
