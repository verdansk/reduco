include ActionView::Helpers::DateHelper

class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  # validates :completed, inclusion: {in: [true,false]}
  enum status: {non_started: 0, started: 1, finished: 2}

  def time_ago
    # Date.today
    # self.start_at
    # self.challenge.duration
    # .weeks
    # .day
    # Date.today + self.challenge.duration.days
    # complete_challenge_date =
    time_ago_in_words(self.start_at + self.challenge.duration.days)

  end

  def duration_passed?
    (self.start_at + self.challenge.duration.days) <= DateTime.now
  end
end
