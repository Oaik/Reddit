class VotePost < ApplicationRecord
  
  # Validation
  validates :post, presence: true
  validates :user, presence: true

  # Association
  belongs_to :user
  belongs_to :post

end
