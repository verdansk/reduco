class Friendship < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  enum friendship_status: {pending: 0, received: 1, accepted: 2, declined: 3}
end
