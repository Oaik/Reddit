class Comment < ApplicationRecord
  # Validation
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  # Association
  belongs_to :user
  belongs_to :post
end
