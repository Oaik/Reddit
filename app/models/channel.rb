class Channel < ApplicationRecord
  # Validation
	validates :name, presence: true
	validates :user_id, presence: true

	# Association
	belongs_to :user
	has_many :posts , dependent: :destroy
	has_many :following_channels
end
