class Emission < ApplicationRecord
  belongs_to :relation, polymorphic: true
  validates :value, presence: true
end
