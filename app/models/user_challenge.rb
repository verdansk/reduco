include ActionView::Helpers::DateHelper

class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  # validates :completed, inclusion: {in: [true,false]}
  enum status: {non_started: 0, started: 1, finished: 2, failed: 3}

  def time_ago
    time_ago_in_words(self.start_at + self.challenge.duration.days + 1)
  end

  def duration_passed?
    (self.start_at + self.challenge.duration.days) <= DateTime.now
  end
end
