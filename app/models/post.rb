class Post < ApplicationRecord
    # Validation
    validates :channel_id, presence: true
    validates :user_id, presence: true
    validates :title, presence: true, length: {maximum: 127}
    validates :body, presence: true
    
    # Association
    belongs_to :user
    belongs_to :channel
    has_many :comments , dependent: :destroy
    has_many :vote_posts , dependent: :destroy
end
