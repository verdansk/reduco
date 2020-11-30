class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  # validates :completed, inclusion: {in: [true,false]}
end
