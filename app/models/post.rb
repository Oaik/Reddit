class Post < ApplicationRecord
    validates :channel_id, presence: true
    validates :user_id, presence: true
    validates :title, presence: true, {maximum: 127}
    validates :body, presence: true
    belongs_to :user
    belongs_to :channel
end
