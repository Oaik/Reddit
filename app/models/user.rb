class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Validation
  validates :username, presence: true
  
  # Association
  has_many :channels, dependent: :destroy
  has_many :following_channels, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :vote_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
