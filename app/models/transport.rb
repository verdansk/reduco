class Transport < ApplicationRecord
  belongs_to :user
  has_many :emissions, as: :relation
  validates :category, presence: true, uniqueness: true
  validates :fuel, presence: true, uniqueness: true
  validates :distance, presence: true
  validates :fuel_consumption, presence: true, numericality: true
end
