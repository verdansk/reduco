class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  # validates :completed, inclusion: {in: [true,false]}
  enum status: {started: 0, finished: 1}
end
