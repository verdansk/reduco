class Challenge < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :xp, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :emission_saving, presence: true, numericality: { only_integer: true }

  has_many :users, through: :user_challenges
end
