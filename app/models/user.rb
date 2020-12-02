class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transports
  has_many :housings
  has_many :emissions, through: :transports

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  def full_name
    first_name + " " + last_name
  end
end
