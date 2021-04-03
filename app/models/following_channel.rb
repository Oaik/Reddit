class FollowingChannel < ApplicationRecord
  # Validation
  validates :user_id, presence: true
  validates :channel_id, presence: true

  # Association
  belongs_to :user
  belongs_to :channel
end
