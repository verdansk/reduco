class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model

  pg_search_scope :search_by_first_last_name_email,
    against: [:first_name, :last_name],
    using: {
      tsearch: { prefix: true} # <-- now `superman batm` will return something!
    }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transports
  has_many :foods
  has_many :housings
  has_many :emissions, through: :transports
  has_many :showers

  has_one_attached :photo

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :gender, presence: true

  def full_name
    first_name + " " + last_name
  end

  def all_friendships
    Friendship.where('user_id=? or friend_id=?',self.id,self.id)
  end

  def animal
    if self.daily_emission.to_i <= 1894
      'hill.svg'
    elsif self.daily_emission.to_i > 1894 && self.daily_emission.to_i < 8500
      'bird.svg'
    elsif self.daily_emission.to_i > 8500 && self.daily_emission.to_i <= 11_200
      'owl.svg'
    elsif self.daily_emission.to_i > 11_200 && self.daily_emission.to_i <= 13_900
      'penguin.svg'
    elsif self.daily_emission.to_i > 13_900 && self.daily_emission.to_i <= 16_600
      'fox.svg'
    elsif self.daily_emission.to_i > 16_600 && self.daily_emission.to_i <= 19_300
      'lion.svg'
    elsif self.daily_emission.to_i > 19_300 && self.daily_emission.to_i <= 22_000
      'bear.svg'
    else
      'cow.svg'
    end
  end
end
